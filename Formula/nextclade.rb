class Nextclade < Formula
  desc 'Viral genome alignment, mutation calling, clade assignment and QC'
  homepage 'https://github.com/nextstrain/nextclade'
  url 'https://github.com/nextstrain/nextclade/archive/refs/tags/2.14.0.tar.gz'
  sha256 '2f83a07fd11349784f8ac8805569e5eed73b4ce67402f04458cb2b72b829ae0d'
  license 'MIT'

  depends_on 'rust' => :build

  def install
    mv '.env.example', '.env'
    system 'cargo', 'install', '--bins', '--path', 'packages_rs/nextclade-cli', '--locked', '--root', prefix
  end

  test do
    system "#{bin}/nextclade", 'dataset', 'get', '--name', 'sars-cov-2', '--output-dir', 'data'
    system "#{bin}/nextclade", 'run', '-d', 'sars-cov-2', '--output-all', 'results', 'data/sequences.fasta'
    system "#{bin}/nextalign", 'run', '--input-ref', 'data/reference.fasta', '--output-all', 'results',
           'data/sequences.fasta'
  end
end
