# OpenVAS Reporting (Dockerized):  


[![Docs](https://readthedocs.org/projects/openvas-reporting/badge/?version=latest&style=flat)](https://openvas-reporting.sequr.be)
[![Known Vulnerabilities](https://snyk.io/test/github/Gunslito/openvasreporting-docker/badge.svg?targetFile=requirements.txt)](https://snyk.io/test/github/Gunslito/openvasreporting-docker?targetFile=requirements.txt)

A tool to convert [OpenVAS](http://www.openvas.org/) XML into reports, now dockerized.

![Report example screenshot](src/docs/_static/img/OpenVASreporting.png?raw=true)

*Read the full documentation at [https://openvas-reporting.sequr.be](https://openvas-reporting.sequr.be)*

# About this Fork

This is a **Dockerized** version of OpenVAS Reporting, forked from the original project [openvasreporting](https://github.com/TheGroundZero/openvasreporting). This fork aims to facilitate the deployment and execution of the tool within a containerized environment.

Credits to [TheGroundZero](https://github.com/TheGroundZero) for the original implementation.

---

## Requirements

 - [Docker](https://www.docker.com/) (Recommended for this fork)
 - Git

## Installation (Docker)

    git clone https://github.com/Gunslito/openvasreporting-docker.git
    cd openvasreporting-docker
    docker build -t openvasreporting .

## Usage (Docker)

    docker run --rm -v /path/to/local/folder:/data openvasreporting -i /data/input.xml -o /data/output.xlsx [-f [Output format]] [-l [minimal threat level (n, l, m, h, c)]] [-t [docx template]]

    current folder execution:
    docker run --rm -v $(pwd):/data openvasreporting -i /data/input.xml -o /data/output.xlsx

    alias openvasreporting='docker run --rm -v /path/to/local/folder:/data openvasreporting'

For more information on usage and filtering options, refer to the original documentation.

## Result

The final report (in Excel format) will then look something like this:

![Report example screenshot - Summary](src/docs/_static/img/screenshot-report.png?raw=true)
![Report example screenshot - ToC](src/docs/_static/img/screenshot-report1.png?raw=true)
![Report example screenshot - Vuln desc](src/docs/_static/img/screenshot-report2.png?raw=true)

Worksheets are sorted according to CVSS score and are colored according to the vulnerability level.

## Credits

Original project by [TheGroundZero](https://github.com/TheGroundZero/openvasreporting).  
Dockerization and maintenance by [Gunslito](https://github.com/Gunslito).