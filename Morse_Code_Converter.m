% Program Tugas Besar: Morse Code Converter
% Menerima masukkan berupa huruf/kalimat alfabet (termasuk angka) lalu
% diproses sehingga mendapat keluaran berupa sandi morse. Program ini juga
% dapat melakukan perintah sebaliknya, yaitu menerima masukkan berupa
% sandi morse dalam bentuk "." (dot) dan/atau "-" (dash) lalu diproses
% sehingga mendapat keluaran berupa huruf/kalimat alfabet (termasuk angka).
% Selain itu, program ini juga dapat memproses sandi morse tersebut
% sehingga mendapat keluaran berupa bunyi/suara/audio dari sandi morse
% tersebut.

% KAMUS
% start, menu, inpTeks, suara1, inpMorse, suara2, kodeMorse.A, kodeMorse.B, ...sampai kodeMorse.Z, kodeMorse.angka1, kodeMorse.angka2, ...sampai kodeMorse.angka0, kodeMorse.sc, teks, code, huruf, angka : char
% i, j : int
% kodeMorse : struct
% kodeMorse.scv : cell
% dot, dash, ssp, lsp, morseAudio, morse (sebelum diproses), t, decode, lcode : double
% pp : audioplayer


% ALGORITMA

% Menjalankan clc (membersihkan Command Window) dan Animasi loading
clc
for i = 1:5
    fprintf('.');
    pause(0.25);
end
clc

%% Awalan (Opening)

fprintf('=== Morse Code Converter ===\n\n')
fprintf('Morse Code Converter merupakan sebuah program yang dapat mengubah\nsebuah teks/kalimat alfabet menjadi sandi morse ataupun sebaliknya.\n\n')

% Masukkan angka "1" untuk melanjutkan program
start = input('Ketik "1" untuk memulai\n','s');


if start == '1'
    % Menjalankan clc (membersihkan Command Window) dan Animasi loading
    clc
    fprintf('Sedang menyiapkan program\nloading')
    for i = 1:5
        fprintf('.');
        pause(0.4);
    end
    clc
    
    % Menyiapkan data-data sandi morse yang diperlukan dengan menggunakan "struct"
    kodeMorse = struct;

    kodeMorse.A = '.-';
    kodeMorse.B = '-...';
    kodeMorse.C = '-.-.';
    kodeMorse.D = '-..';
    kodeMorse.E = '.';
    kodeMorse.F = '..-.';
    kodeMorse.G = '--.';
    kodeMorse.H = '....';
    kodeMorse.I = '..';
    kodeMorse.J = '.---';
    kodeMorse.K = '-.-';
    kodeMorse.L = '.-..';
    kodeMorse.M = '--';
    kodeMorse.N = '-.';
    kodeMorse.O = '---';
    kodeMorse.P = '.--.';
    kodeMorse.Q = '--.-';
    kodeMorse.R = '.-.';
    kodeMorse.S = '...';
    kodeMorse.T = '-';
    kodeMorse.U = '..-';
    kodeMorse.V = '...-';
    kodeMorse.W = '.--';
    kodeMorse.X = '-..-';
    kodeMorse.Y = '-.--';
    kodeMorse.Z = '--..';
    kodeMorse.angka1 = '.----';
    kodeMorse.angka2 = '..---';
    kodeMorse.angka3 = '...--';
    kodeMorse.angka4 = '....-';
    kodeMorse.angka5 = '.....';
    kodeMorse.angka6 = '-....';
    kodeMorse.angka7 = '--...';
    kodeMorse.angka8 = '---..';
    kodeMorse.angka9 = '----.';
    kodeMorse.angka0 = '-----';
    kodeMorse.sc = '.-,''():?!&';
    kodeMorse.scv = {['.-.-.-'], ['-.-.-.'], ['--..--'], ['-.-.-.-'], ['-.--.'], ['-.--.-'], ['---...'], ['..--..'], ['-.-.--'], ['.-...']};

    % Menyimpan data-data sandi morse sebelumnya ke dalam Workspace dengan nama file "data.mat"
    save 'data.mat' 'kodeMorse'
    
    % Memuat data-data yang sebelumnya telah disimpan
    load data.mat
    
    %% Menu
    
    fprintf('=== MENU ===\n\n')
    fprintf('1. Konversi Huruf/Kalimat Menjadi Sandi Morse \n2. Konversi Sandi Morse Menjadi Huruf/Kalimat\n\n');
    
    % Masukkan untuk memilih menu "1" atau "2"
    menu = input('Ketik angka "1" atau "2" untuk memilih menu: ','s');
    
    
    if menu == '1'
        %% Konversi Huruf/Kalimat Menjadi Sandi Morse
        
        clc

        fprintf('=== Alfabetic/Number to Morse Code ===\n\n')

        % Masukkan teks untuk diproses menjadi sandi morse
        inpTeks = input('Silakan Masukkan Teks Yang Ingin Kamu Ubah: ','s');
        
        % Menjalankan clc (membersihkan Command Window) dan Animasi loading
        clc
        for i = 1:3
            fprintf('.');
            pause(0.75);
        end
        clc
        
        % Halaman Hasil setelah diproses
        fprintf('=== Hasil ===\n\n')
        
        % Menampilkan keluaran dari masukkan teks sebelumnya (yang belum diproses)
        fprintf('Teks Input : %s\n', inpTeks);
        
        % Melakukan proses dari teks sebelumnya menjadi sandi morse
        teks = upper(inpTeks);
        morse = [];
        
        % Melakukan perulangan dari 1 sampai panjang teks yang dimasukkan
        for i = 1:length(teks)
            if teks(i) == ' '
                morse = [morse '/'];
                morse = [morse ' '];
            elseif isvarname(teks(i))
                morse = [morse getfield(kodeMorse,teks(i))];
                morse = [morse ' '];
            elseif ~isempty(str2num(teks(i)))
                morse = [morse getfield(kodeMorse, ['angka',teks(i)])];
                morse = [morse ' '];
            elseif findstr(teks(i),kodeMorse.sc)
                morse = [morse char(kodeMorse.scv(findstr(teks(i),kodeMorse.sc)))];
                morse = [morse ' '];
            end
        end

        % Menampilkan hasil berupa sandi morse (setelah diproses)
        fprintf('Sandi Morse: %s\n\n',morse);
        
        % Masukkan "1" untuk memainkan audio/suara/bunyi dari sandi morse
        suara1 = input('Ketik "1" untuk memainkan suara morse\n','s');
        
        if suara1 == '1'
            % Melakukan proses dari sandi morse menjadi audio/bunyi/suara
            
            % Menyiapkan data-data untuk audio/bunyi/suara dari sandi morse
            t = 0:5000;

            dot = sin(t(1:800));
            dash = sin(t(1:2250));
            ssp = zeros(1,2500);
            lsp = zeros(1,4250);

            morseAudio = [];

            % Melakukan perulangan dari 1 sampai panjang sandi morse (hasil proses)
            for i = 1:length(morse)
                if strcmp(morse(i),'.')
                    morseAudio = [morseAudio dot ssp];
                elseif strcmp(morse(i),'-')
                    morseAudio = [morseAudio dash ssp];
                elseif strcmp(morse(i),' ')
                    morseAudio = [morseAudio lsp];
                elseif strcmp(morse(i),'/')
                    morseAudio = [morseAudio lsp ssp];
                end

            end
            
            % Memproses dan memainkan audio/bunyi/suara
            pp = audioplayer(morseAudio,11000);
            play(pp)
            
        end
        
        
        
    elseif menu == '2'
        %% Konversi Sandi Morse Menjadi Huruf/Kalimat
        
        clc
        
        fprintf('=== Morse Code to Alfabetic/Number ===\n\n')
        
        % Masukkan sandi morse untuk diproses menjadi huruf/kalimat alfabet
        inpMorse = input('Silakan Masukkan Sandi Morse Yang Ingin Kamu Ubah: ','s');
        
        % Menjalankan clc (membersihkan Command Window) dan Animasi loading
        clc
        for i = 1:3
            fprintf('.');
            pause(0.75);
        end
        clc
        
        % Halaman Hasil setelah diproses
        fprintf('=== Hasil ===\n\n')
        
        % Menampilkan keluaran dari masukkan sandi morse sebelumnya (yang belum diproses)
        fprintf('Sandi Morse: %s\n', inpMorse);
        
        % Melakukan proses dari sandi morse sebelumnya menjadi huruf/kalimat alfabet
        code = inpMorse;
        decode = [];
        code = [code ' '];
        lcode = [];

        % Melakukan perulangan dari 1 sampai panjang teks sandi morse yang dimasukkan
        for j = 1:length(code) 
            if(strcmp(code(j),' ')) || (strcmp(code(j),'/'))
                for i = double('A'):double('Z')
                    huruf = getfield(kodeMorse,char(i));
                    if strcmp(lcode,huruf)
                        decode = [decode char(i)];
                    end
                end
                for i = 0:9
                    angka = getfield(kodeMorse,['angka',num2str(i)]);
                    if strcmp(lcode,angka)
                        decode = [decode,num2str(i)];
                    end
                end
                for i = 1:10
                    scv = char(kodeMorse.scv(i));
                    if strcmp(lcode,scv)
                        decode = [decode, kodeMorse.sc(i)];
                    end
                end
                lcode = [];
            else lcode = [lcode code(j)];
            end
            if strcmp(code(j),'/')
                decode = [decode ' '];
            end
        end
        
        % Menampilkan hasil berupa huruf/kalimat alfabet (setelah diproses)
        fprintf('Teks Keluaran: %s\n\n', decode)
        
        % Masukkan "1" untuk memainkan audio/suara/bunyi dari sandi morse
        suara2 = input('Ketik "1" untuk memainkan suara morse\n','s');
        
        if suara2 == '1'
            
            % Syntax untuk memproses audio/bunyi/suara dari sandi morse [sama seperti sebelumnya (pada menu == 1)]
            t = 0:5000;

            dot = sin(t(1:800));
            dash = sin(t(1:2250));
            ssp = zeros(1,2500);
            lsp = zeros(1,4250);


            morseAudio = [];

            for i = 1:length(inpMorse)
                if strcmp(inpMorse(i),'.')
                    morseAudio = [morseAudio dot ssp];
                elseif strcmp(inpMorse(i),'-')
                    morseAudio = [morseAudio dash ssp];
                elseif strcmp(inpMorse(i),' ')
                    morseAudio = [morseAudio lsp];
                elseif strcmp(inpMorse(i),'/')
                    morseAudio = [morseAudio lsp ssp];
                end

            end
            
            % Memproses dan memainkan audio/bunyi/suara
            pp = audioplayer(morseAudio,11000);
            play(pp)
            
        end
        
        
        
    else
    %% Bagian ini terjadi apabila masukkan tidak sama dengan "1" atau "2" pada bagian Menu
    
    % Menjalankan clc (membersihkan Command Window) dan Animasi loading (untuk keluar dari program)
    clc
    fprintf('Anda salah memasukkan input\n')
    fprintf('Silakan Coba Lagi')
    for i = 1:5
        fprintf('.');
        pause(0.5);
    end
    fprintf('\n')          
    end
    
    
    
else
    %% Bagian ini terjadi apabila masukkan tidak sama dengan "1" pada bagian Awalan (Opening)
    
    % Menjalankan clc (membersihkan Command Window) dan Animasi loading (untuk keluar dari program)
    clc
    fprintf('Anda salah memasukkan input\n')
    fprintf('Silakan Coba Lagi')
    for i = 1:5
        fprintf('.');
        pause(0.5);
    end
    fprintf('\n')
    
    
end
% Akhir dari ALGORITMA

% Thanks
% The End
