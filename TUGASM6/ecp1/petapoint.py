import mapnik
m = mapnik.Map(3080,2720)
m.background = mapnik.Color('steelblue')
s = mapnik.Style()
r = mapnik.Rule()
polygon_symbolizer = mapnik.PolygonSymbolizer()
polygon_symbolizer.fill = mapnik.Color('#f2eff9')
r.symbols.append(polygon_symbolizer)

line_symbolizer = mapnik.LineSymbolizer()
line_symbolizer = mapnik.LineSymbolizer(mapnik.Color('green'), 1)
line_symbolizer.stroke_width = 20.0

r.symbols.append(line_symbolizer)
basinsLabels = mapnik.TextSymbolizer(mapnik.Expression('[NAMA]'),'DejaVu Sans Bold',5,mapnik.Color('black'))
basinsLabels.halo_fill = mapnik.Color('yellow')
basinsLabels.halo_radius = 2
r.symbols.append(basinsLabels)
point_sym = mapnik.PointSymbolizer()
point_sym.allow_overlap = True
r.symbols.append(point_sym)

s.rules.append(r)
m.append_style('My Style',s)
ds = mapnik.Shapefile(file='D:/GISpeta/TUGASM6/OFFICE.shp')
layer = mapnik.Layer('world2')
layer.datasource = ds
layer.styles.append('My Style')
m.layers.append(layer)



m.zoom_all()
mapnik.render_to_file(m,'world2.pdf', 'pdf')
print "rendered image to 'world3.png'"