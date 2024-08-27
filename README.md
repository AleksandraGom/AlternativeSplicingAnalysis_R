# Characterization of gene model variability over time through quantitative analysis of alternative splicing events
The continuous development of next-generation sequencing technologies and advanced methods of analyzing transcriptomic data is leading to an increasing number of available gene models. This entails the need for a more accurate understanding of the dynamics of changes occurring in the genomes of organisms. It is also becoming possible to identify new genes and splicing variants more precisely, especially in the case of cancer. Modern gene models differ in complexity and accuracy from their earlier counterparts. Moreover, the insufficient annotation of some model organisms raises questions regarding their use for scientific purposes. Therefore, it was considered important to investigate the variability of human and mouse gene models over the years. This was done by analyzing alternative splicing events in various GENCODE and AceView annotations. For this purpose, one of the key functionalities of the SUPPA tool was used, allowing the generation of local alternative splicing events based on the entered annotation. 

## Purpose of work
The purpose of this study was to characterize the variability of gene models over the years. This was done by analyzing alternative splicing (AS) events in different editions of the GENCODE and AceView gene models. This study aimed to determine whether the observed changes in AS reflect the maturation and development of gene models, and how the evolution of these models affects the accuracy and quality of interpretation of transcriptomic results.

Translated with DeepL.com (free version)

## Materials and methods
- *Characteristics of chosen gene models*
  
Selected gene models, GENCODE and AceView, were used to analyze their variation over time and its impact on the detection of alternative splicing events. The models, although different in their approach, are essential tools in the analysis of genomic and transcriptomic data. For this study, six GENCODE human gene models were used, based on the GRCh38 reference genome and covering the period from 2014 to 2024 (Tabela 6.1.1). Each edition differs not only in the number of genes and transcripts identified, but also in the accuracy and completeness of annotation. Similarly, six selected editions of the GENCODE mouse gene model based on the GRCm38 reference genome were included in the analysis, with editions dating from 2013 to 2020 (Tabela 6.1.2).
![image](https://github.com/user-attachments/assets/5fb8aaa8-5fe7-44c3-9c7d-83567df88f94)
![image](https://github.com/user-attachments/assets/43470ec0-af83-4e1c-9e91-143f97fba5f5)

AceView is another genome annotation tool that was used in the analysis. Two versions of the AceView gene model for the latest GRCh37 genome update were considered in this study: the basic version and the extended version (Tabela 6.1.3). The basic version of AceView offers standard genome annotation. The enhanced version has been supplemented with additional alternative transcripts obtained by long-read targeted sequencing. In addition to the full versions of the AceView gene model (basic and extended), the same models were also included, but focused only on selected genes from the AGLR2 and ROCR3 panels that are of key clinical and biological importance. This provided a more thorough understanding of alternative splicing in the context of specific genes of high research value (Tabela 6.1.4).

![image](https://github.com/user-attachments/assets/b4029669-647b-46c0-a891-f8d35a28e409)
![image](https://github.com/user-attachments/assets/cf392986-8fdc-4b1b-983e-bf00d4b19a50)


- *Bioinformatics analysis*

The variation in gene models was characterized by analyzing alternative splicing events in different human and mouse genome models. The analysis included six selected releases of the human GRCh38 genome (Table 6.1.1) and six selected releases of the mouse GRCm38 genome (Table 6.1.2), as published by the GENCODE project. In addition, the AceView annotations of the human GRCh37 genome were examined for both the basic version and the version expanded to include new alternative transcripts. A similar analysis was performed for selected AceView annotation genes from the SEQC2 project, where targeted sequencing using AGLR2 and ROCR3 panels was used. GTF-format annotations for each genome release were downloaded from the GENCODE project and AceView websites. These data formed the basis for further analysis using the SUPPA program. For the purposes of this work, one of the key functionalities of the SUPPA tool was used, which allows the generation of local alternative splicing (AS) events based on the annotation entered. As a result of this program, files containing detailed information about the events detected in each gene belonging to different types of alternative splicing, such as exon skipping, intron retention, alternative 5′/3′ splicing site, mutually exclusive exons and alternative first/last exon were obtained. For each type of alternative splicing, the number of detected events in all analyzed releases of the human and mouse genomes was calculated. To properly interpret and evaluate the obtained values in the context of the changing number of identified genes and transcripts, the number of detected splicing events was normalized against the total number of genes and transcripts present in a given release. In the final step of the analysis, the number of alternative transcripts containing the detected forms of events was determined for each type of alternative splicing. The results obtained were visualized using overview charts, which enabled a clear representation of differences and trends in alternative splicing between the genome versions studied. This allowed the identification of key areas of change and a more complete understanding of the dynamics of gene model evolution. All analysis was performed using the R programming language. 

## Results
The analysis provided valuable insights into the evolution and complexity of the transcriptomes studied, highlighting the importance of integration and continuous updating and optimization of bioinformatics tools. The results represent an important step in understanding the molecular mechanisms underlying various disease states, which will consequently contribute to the development of more precise diagnostic and therapeutic strategies. 
![image](https://github.com/user-attachments/assets/7fca58df-0fd7-47da-ae44-b5f3fb223515)
![image](https://github.com/user-attachments/assets/0198fa06-0d39-45e6-a5df-53ad12aba135)
![image](https://github.com/user-attachments/assets/1c2615a9-b8e6-49ba-b1dd-fe7c9fdbd843)
![image](https://github.com/user-attachments/assets/3fa34691-2e3f-4208-8971-9ab12e41d6bd)




