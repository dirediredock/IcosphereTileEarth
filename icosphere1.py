radiusEarth = 6371

phi = (1 + (5 ** (1 / 2))) / 2

A = [phi, phi, -phi, -phi]
B = [-1, 1, -1, 1]
C = [0, 0, 0, 0]

Xi = B + C + A
Yi = A + B + C
Zi = C + A + B


def euclideanDistance(vector):
    scalar = 0
    for i in vector:
        scalar += i ** 2
    return scalar ** (1 / 2)


def rightArrayScalarDivide(array, scalar):
    export = []
    for i in array:
        export.append(i / scalar)
    return export


def addMidwayVertex(t1, t2, v):
    p1 = v[t1]
    p2 = v[t2]
    temp_vector = []
    for i in range(len(p1)):
        temp_vector.append((p1[i] + p2[i]) / 2)
    scalar = euclideanDistance(temp_vector)
    pm = rightArrayScalarDivide(temp_vector, scalar)
    v.append(pm)
    vertex_index = len(v) - 1
    return vertex_index, v


face_index = [
    [0, 11, 5],
    [0, 5, 1],
    [0, 1, 7],
    [0, 7, 10],
    [0, 10, 11],
    [1, 5, 9],
    [5, 11, 4],
    [11, 10, 2],
    [10, 7, 6],
    [7, 1, 8],
    [3, 9, 4],
    [3, 4, 2],
    [3, 2, 6],
    [3, 6, 8],
    [3, 8, 9],
    [4, 9, 5],
    [2, 4, 11],
    [6, 2, 10],
    [8, 6, 7],
    [9, 8, 1],
]

scalar = euclideanDistance([Xi[0], Yi[0], Zi[0]])

X = rightArrayScalarDivide(Xi, scalar)
Y = rightArrayScalarDivide(Yi, scalar)
Z = rightArrayScalarDivide(Zi, scalar)

v = []

for i in range(len(X)):
    row = []
    row.append(X[i])
    row.append(Y[i])
    row.append(Z[i])
    v.append(row)

f = face_index

subdivisions = 2

if subdivisions > 0:
    for gen in range(subdivisions):
        face_subdivisions = []
        for i in range(len(f)):
            tri = f[i]
            a, v = addMidwayVertex(tri[0], tri[1], v)
            b, v = addMidwayVertex(tri[1], tri[2], v)
            c, v = addMidwayVertex(tri[2], tri[0], v)
            nfc = [[tri[0], a, c], [tri[1], b, a], [tri[2], c, b], [a, b, c]]
            for trio in nfc:
                face_subdivisions.append(trio)
        f = face_subdivisions


import matplotlib.pyplot as plt

# from mpl_toolkits.mplot3d import Axes3D
# from mpl_toolkits.mplot3d.art3d import Poly3DCollection
# import matplotlib.pyplot as plt

fig = plt.figure(figsize=(10, 10))
ax = fig.add_subplot(111, projection="3d", proj_type="ortho")
ax.set_box_aspect(aspect=(1, 1, 1))

for i in range(len(f)):

    x = []
    y = []
    z = []

    for index in f[i]:
        x.append(v[index][0])
        y.append(v[index][1])
        z.append(v[index][2])

    x.append(x[0])
    y.append(y[0])
    z.append(z[0])

    ax.plot(x, y, z)

# fig.patch.set_facecolor("black")
plt.gca().set_position([0, 0, 1, 1])
plt.axis("off")
plt.show()
