# archive

## About

This is the repository for a minimalist, dockerized application that archives websites into the Internet Archive's Wayback Machine and saves a copy to the local machine - which can be pushed to the repository itself, and therefore is also serving as a web-based personal archive.

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

## Summary table

|original                                                                                             |wayback                                                                                                                                         |page                                                                                                                                          |
|:----------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------|
|https://www.freecodecamp.org/news/how-to-dual-boot-windows-10-and-ubuntu-linux-dual-booting-tutorial |https://web.archive.org/web/20230703192448/https://www.freecodecamp.org/news/how-to-dual-boot-windows-10-and-ubuntu-linux-dual-booting-tutorial |https://raw.githack.com/jlnetosci/archive/main/pages/ubuntu_dual_boot/how-to-dual-boot-windows-10-and-ubuntu-linux-dual-booting-tutorial.html |
|https://ucdavis-bioinformatics-training.github.io/2018-June-RNA-Seq-Worksho^Cthursday/DE.html        |https://web.archive.org/web/20230705131451/https://ucdavis-bioinformatics-training.github.io/2018-June-RNA-Seq-Workshop/thursday/DE.html        |https://raw.githack.com/jlnetosci/archive/main/pages/RNAseq_tutorial/DE.html                                                                  |
|https://github.com/GeneralMills/pytrends/issues/550                                                  |https://web.archive.org/web/20230710101645/https://github.com/GeneralMills/pytrends/issues/550                                                  |https://raw.githack.com/jlnetosci/archive/main/pages/google_trends_issues/550.html                                                            |
