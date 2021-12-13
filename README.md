# IcosphereTileEarth

A spinoff of my [SphericalEarth](https://github.com/dirediredock/SphericalEarth) repo. It was through visualizations that I found a problematic feature of 2D geospatial arrays: data points at the other side of the Prime Meridian cross from negative to positive longitude values. This is a big problem when running flat spatial-temporal models, because there is a synthetic “edge” that does not exist in real life, because Earth is a sphere. To solve this, I developed an icosphere segmentation method that isolates regions with these problematic negative-to-positive numeric jumps, and highlights any datasets contained within these bounds. An index of points with this unique property is essential for moving towards dynamic “edgeless” Earth models that work, fundamentally, on planetary datasets as parts of a sphere.


<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/T01.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/T02.png" width="100%">

<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/E02.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/B01.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/B02.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/B03.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/B04.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/B05.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/B06.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/E01.png" width="100%">

<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/T07.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/T05.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/T08.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/T06.png" width="100%">

<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/IcosphereRemap01.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/IcosphereRemap02.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/IcosphereRemap03.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/IcosphereRemap04.png" width="100%">

<img src="https://raw.githubusercontent.com/dirediredock/IcosphereTileEarth/main/Figures/IcosphereRemap.gif" width="100%">
