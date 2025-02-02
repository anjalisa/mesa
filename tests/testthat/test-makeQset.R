test_that("Making a hg19 qseaSet", {

  if(!rlang::is_installed("MEDIPSData")){
    skip("MEDIPSData Not installed")
  }

  sampleTable <- data.frame(sample_name = c("Normal1","Tumour1"),
                            group = c("Normal1","Tumour1"),
                            file_name = c(system.file("extdata", "NSCLC_MeDIP_1N_fst_chr_20_21_22.bam", package = "MEDIPSData", mustWork = TRUE),
                                          system.file("extdata", "NSCLC_MeDIP_1T_fst_chr_20_21_22.bam", package = "MEDIPSData", mustWork = TRUE)))

  testSet <- makeQset(sampleTable,
                       BSgenome = "BSgenome.Hsapiens.UCSC.hg19",
                       chrSelect = paste0("chr",20:22),
                       windowSize = 300,
                       CNVwindowSize = 1000000,
                       fragmentType = "Sheared",
                       CNVmethod = "None",
                       coverageMethod = "PairedAndR1s",
                       minMapQual = 10,
                       minInsertSize = 70,
                       maxInsertSize = 1000,
                       minReferenceLength = 30,
                       badRegions = NULL,
                       properPairsOnly = FALSE)

  expect_equal(testSet %>% qsea::getSampleNames() %>% length(), 2)
  expect_equal(testSet %>% qsea::getChrNames() %>% length(), 3)
  expect_equal(testSet %>% qsea::getRegions() %>% width() %>% unique(), 300)
  expect_equal(testSet %>% qsea::getCounts() %>% colSums() %>% unname(), testSet %>% qsea::getLibSize())
  expect_equal(testSet %>% qsea::getRegions() %>% length(), 541532)

  expect_true("relH" %in% (testSet %>% addLibraryInformation() %>% qsea::getSampleTable() %>% colnames()))

})

test_that("Making a GRCh38 qseaSet", {

  skip_on_ci()

  if(!rlang::is_installed("MEDIPSData")){
    skip("MEDIPSData Not installed")
  }

  sampleTable <- data.frame(sample_name = "Test1",
                            group = "Group1",
                            file_name = "/data/cep/Methylation/pipelineOutput/M004/PipelineBams/MK3_cfDNA_RepB_MeCap.bam",
                            input_file = "/data/cep/Methylation/pipelineOutput/M004/PipelineBams/MK3_cfDNA_RepB_MeCap.bam")

  GRCh38testSet <- makeQset(sampleTable,
                      BSgenome = "BSgenome.Hsapiens.NCBI.GRCh38",
                      chrSelect = 20:22,
                      windowSize = 200,
                      CNVwindowSize = 1000000,
                      fragmentType = "cfDNA",
                      CNVmethod = "HMMdefault",
                      coverageMethod = "PairedAndR1s",
                      minMapQual = 10,
                      minInsertSize = 70,
                      maxInsertSize = 1000,
                      minReferenceLength = 30,
                      badRegions = NULL,
                      properPairsOnly = FALSE)

  expect_equal(GRCh38testSet %>% getSampleNames() %>% length(), 1) #number of samples
  expect_equal(GRCh38testSet %>% getChrNames() %>% length(), 3) #number of chromosomes
  expect_equal(GRCh38testSet %>% getRegions() %>% length(), 809861) #number of windows

  expect_true("relH" %in% (GRCh38testSet %>% addLibraryInformation() %>% getSampleTable() %>% colnames()))

})

test_that("Making a GRCh38 qseaSet proper pairs only", {

  skip_on_ci()

  if(!rlang::is_installed("MEDIPSData")){
    skip("MEDIPSData Not installed")
  }

  sampleTable <- data.frame(sample_name = "Test1",
                            group = "Group1",
                            file_name = "/data/cep/Methylation/pipelineOutput/M004/PipelineBams/MK3_cfDNA_RepB_MeCap.bam",
                            input_file = "/data/cep/Methylation/pipelineOutput/M004/PipelineBams/MK3_cfDNA_RepB_MeCap.bam")

  GRCh38testSet <- makeQset(sampleTable,
                            BSgenome = "BSgenome.Hsapiens.NCBI.GRCh38",
                            chrSelect = 20:22,
                            windowSize = 200,
                            CNVwindowSize = 1000000,
                            fragmentType = "cfDNA",
                            CNVmethod = "HMMdefault",
                            coverageMethod = "PairedAndR1s",
                            minMapQual = 10,
                            minInsertSize = 70,
                            maxInsertSize = 1000,
                            minReferenceLength = 30,
                            badRegions = NULL,
                            properPairsOnly = TRUE)

  expect_equal(GRCh38testSet %>% getSampleNames() %>% length(), 1) #number of samples
  expect_equal(GRCh38testSet %>% getChrNames() %>% length(), 3) #number of chromosomes
  expect_equal(GRCh38testSet %>% getRegions() %>% length(), 809861) #number of windows

  expect_true("relH" %in% (GRCh38testSet %>% addLibraryInformation() %>% getSampleTable() %>% colnames()))

})