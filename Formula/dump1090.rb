class Dump1090 < Formula
  desc "Simple Mode S decoder for RTLSDR devices"
  homepage "https://github.com/MalcolmRobb/dump1090#dump1090-readme"
  # This is a github fork, however the original owner suggests this fork for
  # its greater features: https://github.com/antirez/dump1090#dump1090-readme
  url "https://github.com/MalcolmRobb/dump1090.git",
    :branch   => "master",
    :revision => "bff92c4ad772a0a8d433f788d39dae97e00e4dbe"

  depends_on "pkg-config" => :build
  depends_on "librtlsdr"

  def install
    system "make", "all"
    bin.install "dump1090"
    bin.install "view1090"
  end

  test do
    system "./dump1090", "--ifile", "testfiles/modes1.bin"
  end
end
