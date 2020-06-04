if __name__ == '__main__':
    rows,columns = map(int,(input().split()))
    width = columns
    for i in range(0, int(rows / 2)):
        pattern = ".|." * ((2 * i) + 1)
        print(pattern.center(width, '-'))
    print("WELCOME".center(width, '-'))

    i = int(rows / 2)
    while i > 0:
        pattern = ".|." * ((2 * i) - 1)
        print(pattern.center(width, '-'))
        i = i - 1
