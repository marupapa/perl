# �@Data::Dumper���W���[���̓ǂݍ���
use Data::Dumper 'Dumper';

# �A�n�b�V���̔z��
my $persons = [
    {name => 'Ken', age => 19},
    {name => 'Taro', age => 25}
];

# �B�f�[�^
print Dumper $persons;
