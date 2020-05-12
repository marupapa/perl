use strict;
use warnings;

# �@���W���[���̓ǂݍ���
use Net::FTP;
use File::Spec;
use File::Copy 'move';

# �A�_�E�����[�h�����t�@�C����ۑ�����f�B���N�g��
my $download_dir = 'c:/tmp';

# �B�t�@�C���̃_�E�����[�h
download_files($download_dir);

# �C�t�@�C�����g���q���Ƃɕ��ނ����f�B���N�g���Ɉړ�
categorize_files($download_dir);

# �D�t�@�C�����_�E�����[�h����T�u���[�`��
sub download_files {

    # �D-1 ���[�J���f�B���N�g��
    my $ldir = shift;

    # �D-2 �z�X�g��
    my $host = 'ftp.riken.jp';

    # �D-3 FTP�T�[�o�ɐڑ�
    my $ftp = Net::FTP->new($host)
      or die qq{Can't connect to "$host": $@};

    # �D-4 FTP�T�[�o�փ��O�C��
    $ftp->login('anonymous')
      or die qq{Can't login "$host" } . $ftp->message;

    # �D-5 �_�E�����[�h�����t�@�C����ۑ�����f�B���N�g���̍쐬
    mkdir $ldir unless -d $ldir;

    # �D-6 �����[�g�f�B���N�g��
    my $rdir = '/lang/CPAN/';

    # �D-7 �����[�g�f�B���N�g���̈ړ�
    $ftp->cwd($rdir)
      or die qq{Can't change directory "$rdir" } . $ftp->message;

    # �D-8 �t�@�C���̎擾
    foreach my $file ($ftp->ls) {
        
        # �D-9 �w�肵���g���q�Ƀ}�b�`���Ȃ��ꍇ�͔�΂�
        next unless $file =~ /(\.html|\.gz)$/;
        
        # �D-10 �t�@�C���𖼑O�����ĕۑ�
        $ftp->get($file, File::Spec->catfile($ldir, $file))
          or die qq{Can't get file "$file" } . $ftp->message;
    }
}

# �E�t�@�C�����g���q���Ƃɕ��ނ����f�B���N�g���Ɉړ�����T�u���[�`��
sub categorize_files {

    # �E-1 �f�B���N�g��
    my $dir = shift;
    
    # �E-2 ���ׂẴt�@�C�����擾
    my @files = glob(File::Spec->catfile($dir, '*'));
    @files = grep { -f $_ } @files;
    
    # �E-3 �t�@�C�����g���q�ɉ����ĕ���
    my %exts;
    foreach my $file (@files) {
    
        # �E-4 �g���q���擾
        my $ext;
        if ($file =~ /\.([^\.]+)$/) {
            $ext = $1;
        }
        
        # �E-5 �g���q�����g���ăf�B���N�g�����쐬
        my $ext_dir = File::Spec->catfile($dir, $ext);
        mkdir $ext_dir unless -d $ext_dir;
        
        # �E-6 �t�@�C�����ړ�
        move $file, $ext_dir
          or die qq{Can't move file "$file" to "$ext_dir": $!};
    }
}