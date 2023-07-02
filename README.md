# archive

## About

This is the repository for a minimalist, dockerized application that archives websites into the Internet Archive's Wayback Machine and saves a copy to the local machine -- which can be pushed to the repository itself, and therefore is also serving as a web-based personal archive.

## App

The app is composed by a main `archive` (bash) script and a companion `savepage` (python) script.

`archive` takes three positional arguments:

-   `$1`: URL to be archived

-   `$2`: name of the folder to save the webpage locally

-   `$3`: prefix of web-based personal archive

The script submits the URL to the Wayback Machine via [waybackpy](https://pypi.org/project/waybackpy/), saves a local copy via `savepage`, saves a log of shell outputs (to `outputs.txt`) and adds information to a series of lists (`original.lst`, `folder.lst`, `wayback.lst`, and `archive.lst`) to thereafter create/add to a summary table.

`savepage` is the companion script that handles the download of the webpage, extracts metadata and ouputs a `metadata.txt` file to the folder of interest.

## 🐳 Dockerfile

Usage example:

1.  Pull the image from dockerhub, with `docker pull jlnetosci/archive:v0.1.0`
2.  Use `docker run -v <path/to/local/archive>:/usr/local/etc jlnetosci/archive:v0.1.0 <url_to_save> <folder_name> <prefix_of_personal_web_archive` to run the application.