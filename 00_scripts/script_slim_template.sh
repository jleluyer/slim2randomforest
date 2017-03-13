
// set up a simple neutral simulation
initialize() {
	initializeMutationRate(1e-7);
	// m1 mutation type: neutral
	initializeMutationType("m1", 0.5, "f", 0.0);
	// g1 genomic element type: uses m1 for all mutations
	initializeGenomicElementType("g1", m1, 1.0);
	// uniform chromosome of length 1000 kb with uniform recombination
	initializeGenomicElement(g1, 0, 999999);
	initializeRecombinationRate(1e-8);
}

// create a population of 500 individuals
1 {
	sim.addSubpop("p1", 1000);
	sim.addSubpop("p2", 1000);
}

// add migration rate
1 {
p1.setMigrationRates(p2, 0.01);
p2.setMigrationRates(p1, 0.01);
}

// extract 20 samples by pop and output vcf file
5000 late() {allIndividuals = sim.subpopulations.individuals;
pop1=sample(p1.individuals,20,F);
pop2=sample(p2.individuals,20,F);
combined=c(pop1,pop2);combined.genomes.outputVCF(filePath="02_vcf/test.slim.__NB__.vcf",outputMultiallelics=F);}

