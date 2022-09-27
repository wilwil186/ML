
def fib(n):
    fib = [0, 1]
    for i in range(1, n+1):
        if i > 2:
            fib.append(fib[-2]+fib[-1])
    return fib


def run():
    n = input('Ingresa un número: ')
    assert n.isnumeric() and int(n) > 2, "¡ya la cago! debe ingresar UN NUMERO MAYOR QUE DOS"
    print(fib(int(n)))
    print("Terminó mi programa")
    
if __name__ == '__main__':
    run()