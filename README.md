<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
  <h3 align="center">Bulk RNA-seq Nextflow Pipeline</h3>

  <p align="center">
    A modular Nextflow workflow for RNA-seq analysis, performing quality control, alignment, quantification, and summarization into a gene counts matrix.
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Script</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

---

## About The Project

This pipeline is designed for end-to-end RNA-seq preprocessing and quantification using Nextflow. It takes raw FASTQ files as input, performs quality control, aligns reads to a reference genome, quantifies expression, and generates a final gene counts matrix for downstream analysis.

### Key Features

- Quality control with FastQC and MultiQC
- Reference genome preparation with STAR index building
- GTF parsing for gene annotation
- Read alignment using STAR
- Read quantification using VERSE
- Gene counts matrix generation and differential expression analysis

### Built With

- [Nextflow](https://www.nextflow.io/)
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- [MultiQC](https://multiqc.info/)
- [STAR](https://github.com/alexdobin/STAR)
- [VERSE](https://kim.bio.upenn.edu/software/verse.shtml)
- R

---

## Getting Started

### Prerequisites

- [Nextflow](https://www.nextflow.io/)
- Installed tools and reference data (genome FASTA and annotation files)

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/rboz1/bulk_rnaseq_nextflow.git
2. Create and activate conda environment 
   ```
   conda env create -f base_env.yml
   conda activate nextflow_base
3. Run pipeline
   ```
   nextflow run main.nf -profile conda,cluster

   ** please update your cluster in the nextflow.config if it isn't sge **
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Rachel - rbozadjian@gmail.com

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: www.linkedin.com/in/rachel-bozadjian-203999109
