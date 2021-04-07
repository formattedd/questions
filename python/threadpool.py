from multiprocessing.dummy import Pool as ThreadPool


def f(x):
    return x * x


if __name__ == "__main__":
    p = ThreadPool(5)
    print(p.map(f, [1, 2, 3]))
