import csv


PESSOAL = "PESSOAL"
JURIDICO = "JURIDICO"
PRODUTO = "PRODUTO"
EMPTY_STRING = ""

# RISCO, SEMANA, PROB

def define_risck_name (risk_week):
	
	risk_week = risk_week.split()
	
	category = risk_week[0].split("-")
	if(category[0] == PESSOAL):	
		risk = "PE" + "-" + category[1]
	elif (category[0] == JURIDICO):
		risk = "JU" + "-" + category[1]
	elif (category[0] == PRODUTO):
		risk = "PR" + "-" + category[1]
	else:
		risk = "TEC" + "-" + category[1]

	return risk

def get_array_of_probability (risk_week):
	
	probs = []
	risk_week = risk_week.split()
	

	for i in range(1,len(risk_week)):
		probs.append(float(risk_week[i]))

	return probs

def make_array_of_week_probs (file):

	out = []
	line_file = file.readline()

	while (line_file != EMPTY_STRING):
		out.append(line_file)
		line_file = file.readline()

	return out

def define_category(risk_week):
	risk_week = risk_week.split()
	category = risk_week[0].split("-")
	return category[0]



def main():

	data = open("risco", "r+")

	data = make_array_of_week_probs(data)
	print(data)

	with open('riscos_mapeados.csv', 'w') as csvfile: 
		header = ['risco', 'semana', 'probabilidade', 'categoria']
		writer = csv.DictWriter(csvfile, fieldnames=header)
		writer.writeheader()

		for i in range(1,len(data) + 1):
			j = i - 1
			risk = define_risck_name(data[j])
			probs = get_array_of_probability(data[j])
			category = define_category(data[j])
			
			for j in range(1,9):
				writer.writerow({'risco':risk, 'semana':j, 'probabilidade':probs[j-1], 'categoria':category})







# with open('names.csv', 'w') as csvfile:
#     fieldnames = ['first_name', 'last_name']
#     writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

#     writer.writeheader()
#     writer.writerow({'first_name': 'Baked', 'last_name': 'Beans'})
#     writer.writerow({'first_name': 'Lovely', 'last_name': 'Spam'})
#     writer.writerow({'first_name': 'Wonderful', 'last_name': 'Spam'})
	


main()





