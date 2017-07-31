import csv


PESSOAL = "PESSOAL"
JURIDICO = "JURIDICO"
EMPTY_STRING = ""

# RISCO, SEMANA, PROB

def define_classification (risk_week):
	if(risk_week[0] == PESSOAL):	
		risk = "PE" + "-" + risk_week[1]
	elif (risk_week[0] == JURIDICO):
		risk = "JU" + "-" + risk_week[1]
	else:
		risk = "TEC" + "-" + risk_week[1]

	return risk

def get_array_of_probability (risk_week):
	
	probs = []

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


def main():

	data = open("risco", "r+")

	line_file = data.readline()

	while(line_file != EMPTY_STRING):


	classificacao = data[0].split("-")

	risco = define_classification(classificacao)
	probs = get_array_of_probability(classificacao)



	#criar array de probabilidade
	probs = []

	for i in range(1,len(data)):

		probs.append(float(data[i]))









