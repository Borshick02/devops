def main():
    sum_result = add(5, 3)
    print("Сумма:", sum_result)

    difference_result = subtract(5, 3)
    print("Разность:", difference_result)


def add(a, b):
    return a + b


def subtract(a, b):
    return a - b


if __name__ == "__main__":
    main()
