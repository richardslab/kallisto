version 1.0

workflow Kallisto_index_step1{
  File Homo_sapiens.GRCh38.cdna.fasta
  String strIndexName

  call Kallisto_index{input:Homo_sapiens.GRCh38.cdna.fasta = Homo_sapiens.GRCh38.cdna.fasta}


task Kallisto_index{
  File Homo_sapiens.GRCh38.cdna.fasta
  String strIndexName

  command{
    kallisto index -i ${strIndexName}	${Homo_sapiens.GRCh38.cdna.fasta}  }
  output{
    File idxKallistoIndex = strIndexName
  }
    runtime{
       docker: "jjkrc/kallisto:0.46.1"
       memory: "8 GB"
       cpu: 4
       disks: "local-disk 200 SSD"
    }
}
