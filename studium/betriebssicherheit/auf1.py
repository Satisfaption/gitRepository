
#pakete importieren : 
from graphviz import Graph

# Klassen Definition : 
class ANDNODE :
    art= 'AND'
    def __init__(self, name):
        self.name = name 
        self.nodes = []

    def add(self, node):
        self.nodes.append(node)
        return 
    
            
class ORNODE:
    art='OR'
    def __init__(self, name): 
        self.name = name 
        self.nodes = [] 
    
    def add(self, node ) : 
        self.nodes.append(node)
        return 

class EVENT :
    art = 'EVENT'
    def __init__(self,name):
        self.name = name


# FehlerBaum automatisch erstellen : 
g = Graph(name='Fehlerbaum' , filename='fb' )
g.node_attr['shape'] = 'square'
def ausgabe(var):
    if type(var) == EVENT or var.nodes == [] : 
        g.node(var.art + '\n' + var.name)
    else : 
        for i in var.nodes :
            g.edge(var.art+'\n' + var.name, i.art+'\n' +i.name)
            ausgabe(i)
    return g

# objekte erstellen : 

TOP = ANDNODE('TOP')
A = ORNODE('A')
E1 = EVENT('1')
b = ORNODE('orb')
c = ANDNODE('andc')

TOP.add(A)
TOP.add(E1)
A.add(b)
A.add(c)


# ausführen : 
ausgabe(TOP)
g.view()
