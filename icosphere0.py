# by Matias I. Bofarull Oddo 2021.12.26

phi = (1 + (5 ** (1 / 2))) / 2

A = [phi, phi, -phi, -phi]
B = [-1, 1, -1, 1]
C = [0, 0, 0, 0]

Xi = B + C + A
Yi = A + B + C
Zi = C + A + B


def euclideanDistance(vector):
    sum = 0
    for i in vector:
        sum += i ** 2
    return sum ** (1 / 2)


def rightArrayScalarDivide(array, scalar):
    export = []
    for i in array:
        export.append(i / scalar)
    return export


scalar = euclideanDistance([Xi[0], Yi[0], Zi[0]])

X = rightArrayScalarDivide(Xi, scalar)
Y = rightArrayScalarDivide(Yi, scalar)
Z = rightArrayScalarDivide(Zi, scalar)

face_index = [
    [1, 12, 6],
    [1, 6, 2],
    [1, 2, 8],
    [1, 8, 11],
    [1, 11, 12],
    [2, 6, 10],
    [6, 12, 5],
    [12, 11, 3],
    [11, 8, 7],
    [8, 2, 9],
    [4, 10, 5],
    [4, 5, 3],
    [4, 3, 7],
    [4, 7, 9],
    [4, 9, 10],
    [5, 10, 6],
    [3, 5, 12],
    [7, 3, 11],
    [9, 7, 8],
    [10, 9, 2],
]

import matplotlib.pyplot as plt

# from mpl_toolkits.mplot3d import Axes3D
# from mpl_toolkits.mplot3d.art3d import Poly3DCollection
# import matplotlib.pyplot as plt

fig = plt.figure(figsize=(10, 10))
ax = fig.add_subplot(111, projection="3d", proj_type="ortho")
ax.set_box_aspect(aspect=(1, 1, 1))

for i in range(len(face_index)):

    x = []
    y = []
    z = []

    for index in face_index[i]:
        x.append(X[index - 1])
        y.append(Y[index - 1])
        z.append(Z[index - 1])

    x.append(x[0])
    y.append(y[0])
    z.append(z[0])

    ax.plot(x, y, z)

# fig.patch.set_facecolor("black")
plt.gca().set_position([0, 0, 1, 1])
plt.axis("off")
plt.show()
