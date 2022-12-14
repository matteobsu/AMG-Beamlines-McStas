clear all
close all

foldername = 'BOA_beamline_imaging_20221212_161930';
pD = McLoadPSD([foldername '/pinhole_Divergence.dat']);

MpB = McLoadL([foldername '/Mean_pinhole_Brilliance.dat']);
PpB = McLoadL([foldername '/Peak_pinhole_Brilliance.dat']);
Sp = McLoadL([foldername '/SpectrumAtDetector.dat']);

img = McLoadPSD([foldername '/AndorIkonL.dat']);

figure, imagesc(linspace(-2,2,100),linspace(-2,2,100),pD), title('Divergence at pinhole')
xlabel('degrees'), ylabel('degrees')
figure, imagesc(linspace(-130/2,130/2,512),linspace(-130/2,130/2,512),imgaussfilt(img,3)), title('iKon-L image')
xlabel('mm'), ylabel('mm')
%%
load BOA_spectrum.mat
figure,
plot(MpB(:,1),MpB(:,2)./max(MpB(:,2))), hold on
plot(Sp(:,1),Sp(:,2)./max(Sp(:,2))), hold on
plot(BOA(:,1),BOA(:,2))
grid
legend('Mean Brilliance','Spectrum at iKonL','Measured')
% legend('Mean Brilliance','Peak Brilliance','Spectrum at iKonL')
% set(gca,'Yscale','log')%, ylim([1e5 1e18])