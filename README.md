# OpenVAS Reporting (Dockerized):  
[![Known Vulnerabilities](https://snyk.io/test/github/Gunslito/openvasreporting-docker/badge.svg?targetFile=src/requirements.txt)](https://snyk.io/test/github/Gunslito/openvasreporting-docker?targetFile=src%2Frequirements.txt&tab=issues)

A tool to convert [OpenVAS](http://www.openvas.org/) XML into reports, now dockerized.

![Report example screenshot](src/docs/_static/img/OpenVASreporting.png?raw=true)

*Read the full documentation at [https://openvas-reporting.sequr.be](https://openvas-reporting.sequr.be)*

# About this Fork

This is a **Dockerized** version of OpenVAS Reporting, forked from the original project [openvasreporting](https://github.com/TheGroundZero/openvasreporting). This fork aims to fix some problems with the parser and facilitate the deployment and execution of the tool within a containerized environment.

Credits to [TheGroundZero](https://github.com/TheGroundZero) for the original implementation.

---

## Requirements

 - [Docker](https://www.docker.com/)
 - Git (For offline image build)

## Docker Hub Image
 - [gunslito/openvasreporting](https://hub.docker.com/r/gunslito/openvasreporting)

## Local image build & use (Offline)

```bash
localpath="/path/to/local/folder"
git clone https://github.com/Gunslito/openvasreporting-docker.git
cd openvasreporting-docker
docker build -t openvasreporting .
docker run --rm -v ${localpath}:/data openvasreporting -i /data/input.xml -o /data/output.xlsx
```

## Usage (Online)

```bash
localpath="/path/to/local/folder"
tagversion="latest"

docker run --rm -v ${localpath}:/data gunslito/openvasreporting:${tagversion} -i /data/input.xml -o /data/output.xlsx
```

## Parameters:

- **Volume Mounting (`-v /path/to/local/folder:/data`)**  
  Maps a local directory to the container's `/data` directory for input and output file access.

- **Input File (`-i /data/input.xml`)**  
  Specifies the path to the OpenVAS XML report within the container.

- **Output File (`-o /data/output.xlsx`)**  
  Defines the desired output file path and name within the container.

- **Output Format (`-f`)** *(optional)*  
  Sets the report format: `xlsx` for Excel or `docx` for Word.

- **Minimal Threat Level (`-l`)** *(optional)*  
  Filters vulnerabilities by minimum threat level:  
  - `n` = none  
  - `l` = low  
  - `m` = medium  
  - `h` = high  
  - `c` = critical  

- **Template (`-t`)** *(optional)*  
  Specifies a custom Word template for the report.

For more information on usage and filtering options, refer to the original documentation.

## Result

The final report (in Excel format) will then look something like this:

![Report example screenshot - Summary](src/docs/_static/img/screenshot-report.png?raw=true)
![Report example screenshot - ToC](src/docs/_static/img/screenshot-report1.png?raw=true)
![Report example screenshot - Vuln desc](src/docs/_static/img/screenshot-report2.png?raw=true)

Worksheets are sorted according to CVSS score and are colored according to the vulnerability level.

## Credits

Original project by [TheGroundZero](https://github.com/TheGroundZero/openvasreporting).  
Dockerization and parser fixing by [Gunslito](https://github.com/Gunslito).
