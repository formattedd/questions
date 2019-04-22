import multiprocessing


def func(msg):
    return multiprocessing.current_process().name + '-' + msg


if __name__ == "__main__":
    pool = multiprocessing.Pool(processes=multiprocessing.cpu_count())
    results = []
    for i in range(10):
        msg = "hello %d" % (i)
        results.append(pool.apply_async(func, (msg, )))
    pool.close()
    pool.join()
    print("Sub-process(es) done.")

    for res in results:
        print(res.get())
