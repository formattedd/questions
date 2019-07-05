import multiprocessing


def f(msg):
    print(msg)
    return multiprocessing.current_process().name + '-' + msg


def func1():
    pool = multiprocessing.Pool(processes=multiprocessing.cpu_count())
    results = []
    for i in range(10):
        msg = "hello %d" % (i)
        results.append(pool.apply_async(f, (msg, )))
    pool.close()
    pool.join()
    print("Sub-process(es) done.")

    for res in results:
        print(res.get())


def func2():
    from multiprocessing import Pool
    # with Pool(5) as p:
    with Pool(processes=multiprocessing.cpu_count()) as p:
        print(p.map(f, [str(i) for i in range(9)]))


if __name__ == "__main__":
    # func1()
    func2()
