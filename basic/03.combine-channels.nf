Channel
  .of('demux.Clontech_5p--bc1003_3p.flnc_clustered.sorted.sam',
      'demux.Clontech_5p--bc1001_3p.flnc_clustered.sorted.sam',
      'demux.Clontech_5p--bc1002_3p.flnc_clustered.sorted.sam')
  .set { aligment_ch }

Channel
  .of('demux.Clontech_5p--bc1001_3p.flnc_clustered.fasta',
      'demux.Clontech_5p--bc1002_3p.flnc_clustered.fasta',
      'demux.Clontech_5p--bc1003_3p.flnc_clustered.fasta')
  .set { clustered_ch }

aligment_ch
    .map {[it.toString().split("--")[1].split("_3p")[0], it]}
    .set {aligment_ch}

clustered_ch
    .map {[it.toString().split("--")[1].split("_3p")[0], it]}
    .set {clustered_ch}

aligment_ch
    .combine(clustered_ch, by: 0)
    .map {id, sam, fasta -> [sam, fasta]}
    .view()