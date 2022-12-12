clear all
close all

foldername = 'BOA_beamline_imaging_20221212_161930';
pD = McLoadPSD([foldername '/pinhole_Divergence.dat']);

MpB = McLoadL([foldername '/Mean_pinhole_Brilliance.dat']);
PpB = McLoadL([foldername '/Peak_pinhole_Brilliance.dat']);
Sp = McLoadL([foldername '/SpectrumAtDetector.dat']);

img = McLoadPSD([foldername '/AndorIkonL.dat']);

figure,
plot(MpB(:,1),MpB(:,2)./sum(MpB(:,2))), hold on
% plot(PpB(:,1),PpB(:,2)./sum(PpB(:,2))), hold on
plot(Sp(:,1),Sp(:,2)./sum(Sp(:,2))/0.023*0.00487), hold on
grid
legend('Mean Brilliance','Spectrum at iKonL')
% legend('Mean Brilliance','Peak Brilliance','Spectrum at iKonL')
% set(gca,'Yscale','log')%, ylim([1e5 1e18])

figure, imagesc(pD), title('Divergence at pinhole')
figure, imagesc(img), title('iKon-L image')

%%
load BOA_spectrum.mat
figure,
plot(BOA(:,1),BOA(:,2)), hold on
plot(Sp(:,1),Sp(:,2)./max(Sp(:,2))), hold on