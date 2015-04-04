module ImageMagick

using Requires
importall FileIO

# Define the Back-end Name
global const BACKEND = Val{:imagemagick}
# Include the supported formats first, so they are immediately available
include("supported_formats.jl")
# lazily load the core modules
@lazymod ImageMagickIO "imageio_interface.jl"

#just if read is actually used, load the full IO module
FileIO.read(file::readformats(BACKEND), ::Type{BACKEND}) = imagemagickio().imagemagickread(abspath(file))


end # module
