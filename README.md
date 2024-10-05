# Challenge-de-Platform-Engineer---XpandIT

This repository provides the steps to run a Tomcat application using Docker.

## Prerequisites

- Docker installed on your machine. You can download it from Docker's official website.

## Steps to Reproduce

1. **Clone the Repository**

You can download the content using HTTPS or ssh. If you opt for downloading using ssh, you should have git installed on your machine and can clone the repository by running the following command:
   
   `git clone https://github.com/Alexmsimoes95/Challenge-de-Platform-Engineer-XpandIT.git`

3. **Place on**

To dockarize the application correctly you should place inside the repository created folder "Challenge Platform Engineer"

5. **Commands to run**

After you placed on the repository folder, you should run the commands below in the presented order.
     a. `./self-signer.sh`
     b. `docker build -t <app_free-name_choosed> .`
     c. `docker run -d -p 4041:4041 <name_choosed_on_build>`

6. **Validation of work**

After runned the commands above you should go to a web browser and right down the url [https://localhost:4041/challenge](https://localhost:4041/challenge) , after that you are advised about the security of the website, since the certificates used are not full domain signed you should press "Advanced..." and accept to proceed to the website.
