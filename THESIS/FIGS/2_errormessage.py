

#%%

hi = "Hello World"
# print(Hi)


#%%

class Gene:                               # Define a Gene class
    def __init__(self, sequence: str):    # Define how a Gene object is created
        self.sequence: str = sequence     # Save sequence as attribute
        self.promoter: str = self.find_promoter() # Automatically find promoter
        # Add further Gene attributes here, e.g. gene name, organism, etc.
    def find_promoter(self):              # Define how to find the promoter
        return self.sequence.find('TATA')
    def find_restriction_site(self):      # Define how to find restriction site
        return self.sequence.find('GCGC') # Find the position of 'GCGC'
    def cut(self):                        # Define how to cut the DNA sequence
        position = self.find_restriction_site() # Call the method above
        return self.sequence[position:]   # Cut the gene at the position

gene1 = Gene(sequence='TGAGCTGAGCTGATGCGCTATATTTAGGCG') # Create Gene object
gene1_cut = gene1.cut()                   # Call the method cut and save result
print(gene1_cut)                          # Show result
# Expected output: GCGCTATATTTAGGCG


#%%

class mRNA(Gene):          # Define the mRNA class, inheriting from Gene class
    def __init__(self, sequence: str):   # Define how an mRNA object is created
        super().__init__(sequence)       # Get attributes from parent class
        self.sequence = self.sequence.replace('T', 'U')  # Replace T with Uracil
    def find_stopcodons(self):           # Define how to find stop codons
        for stopcodon in ['UGA', 'UAA', 'UAG']: # Loop over stop codons
            position = self.sequence.find(stopcodon) # Find the position
            if position == -1:           # If position is -1, codon wasn't found
                print(f"{stopcodon} not found") # Message if not found
            else:                        # If position isn't -1, codon was found
                print(f"{stopcodon} found at {position}")         
            
mrna1 = mRNA(sequence='TGAGCTGAGCTGATGCGCTATATTTAGGCG') # Create an mRNA object
mrna1.find_stopcodons()              # Show the position of stop codons
# Expected outputs: 0, 24

# Expected outputs: 0, 24