#!/bin/bash

notePath=$HOME/Documents/personal/Notes/inbox
notePathDest=$HOME/Documents/personal/Notes

function cleanPara(){
	tags=$(echo $1 | tr '[:upper:]' '[:lower:]' | sed -E 's/(projects?|areas?|resources?|archives?)//' | tr -dc '[:alnum:]')

	echo $tags
}

function slug(){
	echo "_$(echo $1  | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)"
}

function move(){
	IFS=$'\n'
	for file in $(find $notePathDest -name '*.md'); do
		yaml=$(sed -n '/^---$/,/^---$/p' $file | sed 's/---//')
		
		title=$(echo -e "$yaml" | yq -r '.title')
		tags=$(echo -e "$yaml" | yq -r '.tags | @csv')
		date=$(echo -e "$yaml" | yq -r '.date')
		

		if [ $(echo $tags | grep "wip") ]; then 
			continue
		fi

		if [ $(echo $tags | grep "archive") ]; then 
			subfolder=$(cleanPara $tags)
			mkdir -p "$notePathDest/archives/$subfolder"
			targetpath="$notePathDest/archives/$subfolder/$date$(slug $title).md"
			if [ "$file" != "$targetpath" ]; then
				mv "$file" $targetpath 
			fi
		fi

		if [ $(echo $tags | grep "resource") ]; then 
			subfolder=$(cleanPara $tags)
			targetpath="$notePathDest/resources/$subfolder/$date$(slug $title).md"
			mkdir -p "$notePathDest/resources/$subfolder"
			if [ "$file" != "$targetpath" ]; then
				mv "$file" $targetpath 
			fi
		fi

		if [ $(echo $tags | grep "area") ]; then 
			subfolder=$(cleanPara $tags)
			mkdir -p "$notePathDest/areas/$subfolder"
			targetpath="$notePathDest/areas/$subfolder/$date$(slug $title).md"
			if [ "$file" != "$targetpath" ]; then
				mv "$file" $targetpath 
			fi
		fi

		if [ $(echo $tags | grep "project") ]; then 
			subfolder=$(cleanPara $tags)
			mkdir -p "$notePathDest/projects/$subfolder"
			targetpath="$notePathDest/projects/$subfolder/$date$(slug $title).md"
			if [ "$file" != "$targetpath" ]; then
				mv "$file" $targetpath 
			fi
		fi

	done
}

function new(){
	if [ "$1" == "t" ]; then 
		name=$(date -d "tomorrow" +"%Y-%m-%d")
	elif [ "$1" == "y" ]; then
		name=$(date -d "yesterday" +"%Y-%m-%d")
	else
		name=$(date +"%Y-%m-%d")
	fi

	if [ "$1" != "t" ] && [ "$1" != "y" ]; then 
		if [ ! -z "$1" ]; then 
			title="-$(echo $@  | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)"
		fi
	fi

	filePath="$notePath/$name$title.md"
	touch $filePath
	nvim "$filePath" 
	#echo $filePath
}

function open(){
	note=$(find "$notePathDest" -name "*.md" | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' )

	nvim $note
}

function list(){
	eza -T "$notePathDest/$1"
}

function tm(){
	echo -e "---
title: $1 
date: "$(date +"%Y-%m-%d")"
tags: [ "wip", "meeting" ]
---
"
}

function tn(){
	echo -e "---
title: $1 
date: "$(date +"%Y-%m-%d")"
tags: ["wip"]
---
"
}

function nid(){
	yaml=$(sed -n '/---/,/---/p' $1 | sed 's/---//')
	
	title=$(echo -e "$yaml" | yq -r '.title' | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)
	date="$(echo -e "$yaml" | yq -r '.date')_"
	echo "id: $date$title"
}

function openTodo(){
	nvim "$notePath/todo.md"
}

$1 $2 $3
