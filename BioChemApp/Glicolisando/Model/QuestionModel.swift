//
//  QuestionModel.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import Foundation

enum Subjects: String, CaseIterable {
    case glicose, glicolise, glicogenio, glicogenese, gliconeogenese
}

enum QuestionType {
    case trueFalse, multipleChoice
}

protocol Question {
    var subject: Subjects { get }
    var questionType: QuestionType { get }
    var question: String { get }
    var correctAnswer: String { get }
    var explanation: String { get }
}

struct MultipleChoiceQuestion: Question {
    let subject: Subjects
    let questionType: QuestionType = .multipleChoice
    let question: String
    let correctAnswer: String
    let explanation: String
    let choiceA: String
    let choiceB: String
    let choiceC: String
    let choiceD: String
    let choiceE: String
}

struct TrueFalseQuestion: Question {
    let subject: Subjects
    let questionType: QuestionType = .trueFalse
    let question: String
    let correctAnswer: String
    let explanation: String
}

let questionsBacklog: [Question] = [
    MultipleChoiceQuestion(subject: .glicose,
                           question: "Qual é a principal fonte de energia dos animais?",
                           correctAnswer: "Glicose",
                           explanation: "A glicose é um carboidrato simples do tipo monossacarídeo e representa a principal fonte de energia dos seres vivos. Ela pode ser encontrada livre ou combinada com outros tipos de carboidratos.",
                           choiceA: "Amido",
                           choiceB: "Glicose",
                           choiceC: "H2O",
                           choiceD: "Colesterol",
                           choiceE: "Proteína"),
    TrueFalseQuestion(subject: .glicogenio,
                      question: "O glicogênio é um polissacarídeo formado por milhares de unidades de glicose.",
                      correctAnswer: "Verdadeiro",
                      explanation: "O glicogênio, que é um polímero de resíduos de glicose, é o principal polissacarídeo de reserva em animais e é encontrado em todas as células."),
    MultipleChoiceQuestion(subject: .glicogenio,
                           question: "Os principais sítios de armazenamento do glicogênio são:",
                           correctAnswer: "Músculo e fígado",
                           explanation: "Os principais sítios de armazenamento de glicogênio são o músculo e o fígado. Nestes tecidos o glicogênio é armazenado na forma de grânulos, aonde estão presentes também as enzimas responsáveis pela sua metabolização.",
                           choiceA: "Estômago e intestino",
                           choiceB: "Músculo e cérebro",
                           choiceC: "Corrente sanguínea e fígado",
                           choiceD: "Fígado e estômago",
                           choiceE: "Músculo e fígado"),
    TrueFalseQuestion(subject: .glicolise,
                      question: "A glicólise consiste no processo de união das moléculas de glicose para a produção de energia.",
                      correctAnswer: "Falso",
                      explanation: "A glicólise é um processo que degrada a glicose em duas moléculas menores, sendo essencial para a produção de energia dos organismos. Ela é dividida em duas fases, uma de investimento energético e a outra de compensação energética."),
    MultipleChoiceQuestion(subject: .glicolise,
                           question: "Qual é a alternativa correta que completa a seguinte afirmação?",
                           correctAnswer: "Ácido e Glicólise.",
                           explanation: "O piruvato, também chamado de ácido pirúvico, é um a-cetoácido que pode ser originado tanto pela glicólise como pela degradação dos aminoácidos alanina, cisteína, glicina, serina, treonina e triptofano.",
                           choiceA: "Lipídio e Metabolismo de lipídios.",
                           choiceB: "Ácido e Glicólise.",
                           choiceC: "Carboidrato e Glicólise.",
                           choiceD: "Proteína e Ciclo de Krebs.",
                           choiceE: "Açúcar e Respiração celular."),
    TrueFalseQuestion(subject: .gliconeogenese,
                      question: "Glicerol pode ser convertido em glicose.",
                      correctAnswer: "Verdadeiro",
                      explanation: "Quando os níveis de D-glicose sanguínea estão baixos, compostos como alanina, lactato, glicerol e ácido propiônico podem ser transformados em D-glicose através da via gliconeogênica para normalizar os níveis glicêmicos do organismo."),
    TrueFalseQuestion(subject: .gliconeogenese,
                      question: "A gliconeogênese consiste na formação de glicose a partir de compostos que não são carboidratos, como lipídios e aminoácidos.",
                      correctAnswer: "Verdadeiro",
                      explanation: "Durante o jejum, a glicose é formada a partir de precursores não-glucídicos por meio da gliconeogênese, sendo esses principais precursores lactato, piruvato, glicerol e aminoácidos."),
    TrueFalseQuestion(subject: .gliconeogenese,
                      question: "Somente o glucagon estimula o processo da gliconeogênese.",
                      correctAnswer: "Falso",
                      explanation: "O glucagon, cortisol e GH são hormônios que mobilizam reservas energéticas, contribuindo na estimulação da gliconeogênese."),
    MultipleChoiceQuestion(subject: .glicogenio,
                           question: "Qual é o hormônio responsável pela conversão de ATP na glicogenólise?",
                           correctAnswer: "Glucagon",
                           explanation: "O Glucagon é um hormônio polipeptídeo produzido no pâncreas e nas células do trato gastrointestinal. O seu papel mais conhecido é aumentar a glicemia contrapondo-se aos efeitos da insulina. Ele atua na conversão de ATP na glicogenólise, com imediata produção e liberação de glicose pelo fígado.",
                           choiceA: "Glicogênio sintase",
                           choiceB: "Glicogênio fosforilase",
                           choiceC: "Glucagon",
                           choiceD: "Insulina",
                           choiceE: "Colecistocinina"),
    MultipleChoiceQuestion(subject: .glicogenese,
                           question: "Qual é o hormônio responsável pela conversão de glicose em glicogênio?",
                           correctAnswer: "Insulina",
                           explanation: "No fígado e músculo, a insulina age na ativação da enzima glicogênio sintetase, a qual converte o excesso de glicose livre em uma cadeia de glicose denominada glicogênio.",
                           choiceA: "Glucagon",
                           choiceB: "Insulina",
                           choiceC: "Glicogênio sintase",
                           choiceD: "Glicogênio fosforilase",
                           choiceE: "Colecistocinina"),
    MultipleChoiceQuestion(subject: .glicogenio,
                           question: "As fibras musculares estriadas armazenam um carboidrato a partir do qual se obtém energia para a contração. Essa substância de reserva se encontra na forma de:",
                           correctAnswer: "Glicogênio",
                           explanation: "O glicogênio é um polissacarídeo encontrado nos músculos e no fígado dos animais. Ele serve como reserva energética, e quando a taxa de glicose no sangue abaixa, geralmente nos períodos entre as refeições, as células do fígado quebram esse glicogênio, reconvertendo-o em glicose.",
                           choiceA: "Amido",
                           choiceB: "Glicose",
                           choiceC: "Maltose",
                           choiceD: "Sacarose",
                           choiceE: "Glicogênio"),
    TrueFalseQuestion(subject: .gliconeogenese,
                      question: "Nos ruminantes a glicose sanguínea deriva originalmente da gliconeogênese,que utiliza o ácido propiônico como substrato.",
                      correctAnswer: "Verdadeiro",
                      explanation: "O ácido propiônico é um AGV ,ou seja ,um ácido graxo volátil , que quando absorvido no rúmen como substrato auxilia como fonte de energia para o metabolismo dos ruminantes."),
    MultipleChoiceQuestion(subject: .glicogenio,
                           question: "O glicogênio é encontrado em animais e caracteriza-se por ser:",
                           correctAnswer: "um polissacarídeo.",
                           explanation: "O glicogênio é um polissacarídeo, um polímero de glicose",
                           choiceA: "um monossacarídeo.",
                           choiceB: "um dissacarídeo.",
                           choiceC: "um polissacarídeo.",
                           choiceD: "um lipídeo.",
                           choiceE: "uma proteína."),
    MultipleChoiceQuestion(subject: .glicogenese,
                           question: "Em qual parte do corpo humano o glicogênio apresenta maior quantidade?",
                           correctAnswer: "Nos músculos e fígados.",
                           explanation: "O glicogênio é encontrado em maior quantidade nas células do fígado e também nos músculos. No fígado, ele atua como uma reserva de glicose, e no músculo está presente apenas para enfrentar as necessidades desse tecido.",
                           choiceA: "Nas células dos pulmões.",
                           choiceB: "Nos rins.",
                           choiceC: "Nos músculos e nos rins.",
                           choiceD: "Nos músculos e fígados.",
                           choiceE: "Nos músculos apenas."),
    MultipleChoiceQuestion(subject: .glicogenese,
                           question: "Quando ocorre um aumento na demanda de açúcar no corpo, o glicogênio é quebrado liberando:",
                           correctAnswer: "glicose.",
                           explanation: "O glicogênio é formado por várias unidades de glicose e, ao sofrer hidrólise, as libera.",
                           choiceA: "amido.",
                           choiceB: "frutose.",
                           choiceC: "lactose.",
                           choiceD: "celulose.",
                           choiceE: "glicose."),

]

//MultipleChoiceQuestion(subject: ,
//                       question: <#T##String#>,
//                       correctAnswer: <#T##String#>,
//                       explanation: <#T##String#>,
//                       choiceA: <#T##String#>,
//                       choiceB: <#T##String#>,
//                       choiceC: <#T##String#>,
//                       choiceD: <#T##String#>,
//                       choiceE: <#T##String#>),
//
//TrueFalseQuestion(subject: <#T##Subjects#>,
//                  question: <#T##String#>,
//                  correctAnswer: <#T##String#>,
//                  explanation: <#T##String#>),
