with open("ids.yaml",'r') as file:
    lines = file.readlines()

with open("ids.yaml",'w') as file:
    for line in lines:
        
        if line.find("delete") != -1:
            pass
        else:
            file.write(line)
