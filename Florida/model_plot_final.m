

      tvec=data_date(1)+caldays(1:length(plot_vector_1(:,7)));
      
       %%
     temp_x_11 = plot_vector_1(:,8);
     temp_x_12 = zeros(length(temp_x_11), 1);
     
     
     
     temp_x_21 = plot_vector_2(:,8);
     temp_x_22 = zeros(length(temp_x_21), 1);

     
     temp_x_31 = plot_vector_3(:,8);
     temp_x_32 = zeros(length(temp_x_31), 1);
    
     
 for i = 1:length(temp_x_31)-1
     
     temp_x_12(i+1) = temp_x_11(i+1)-temp_x_11(i);
     
 
     temp_x_22(i+1) = temp_x_21(i+1)-temp_x_21(i);
     
     temp_x_32(i+1) = temp_x_31(i+1)-temp_x_31(i);
   
     
        
 end
   
     
     
     
      data_i1 = data_i;
      data_i2 = zeros(length(data_i), 1);
      
      
  for j = 1: length(data_i1)-1
      
     data_i2(j+1) = data_i1(j+1)-data_i1(j);
        
  end
       
      figure('Renderer', 'painters', 'Position', [0 0 1500 400])
      
      s1 = subplot(1,3,1);
      
      plot(tvec,plot_vector_1(:, 7), 'LineWidth',3, 'color', '[1.0, 0.49, 0.0]')
      hold on
      plot(tvec, plot_vector_2(:, 7), 'LineWidth',3, 'color', '[0.55, 0.71, 0.0]')
      hold on
      plot(tvec, plot_vector_3(:, 7), 'LineWidth',3, 'color', '[0.0, 0.5, 0.0]')
      hold on
      

      scatter(data_date,data_d,'b','LineWidth',1)
      xlim([datetime(data_date(1)),datetime(tvec(length(tvec)))])
      ylim([0 max([plot_vector_1(:, 7); plot_vector_2(:, 7);  plot_vector_3(:, 7); data_d])])
     % xlabel('Day(s)','FontSize',15)
      ylabel('Cumulative deaths','FontSize',15)
     legend('10% increase in Social Distancing','10% decrease in Social Distancing', 'No change in Social Distancing','Data' ,'FontSize',13, 'Location','northwest')
     legend boxoff
      
      s2 = subplot(1,3,2);
      
      plot(tvec, plot_vector_1(:, 8), 'LineWidth',3, 'color', '[1.0, 0.49, 0.0]')
      hold on
      plot(tvec, plot_vector_2(:, 8),  'LineWidth',3, 'color', '[0.55, 0.71, 0.0]')
      hold on
      plot(tvec, plot_vector_3(:, 8),  'LineWidth',3, 'color', '[0.0, 0.5, 0.0]')
      hold on
      
     
      
      scatter(data_date,data_i,'b','LineWidth',1)
      xlim([datetime(data_date(1)),datetime(tvec(length(tvec)))])
      ylim([0 max([plot_vector_1(:, 8);  plot_vector_2(:, 8);  plot_vector_3(:, 8); data_i])])
      ylabel('Cumulative cases','FontSize',15)
      title(state_name, 'FontSize', 15)
      
      
 
      s3 = subplot(1,3,3);
     
      plot(tvec,temp_x_12, 'LineWidth',3, 'color', '[1.0, 0.49, 0.0]')
      hold on
      plot(tvec,temp_x_32,  'LineWidth',3, 'color', '[0.55, 0.71, 0.0]')
      hold on
      plot(tvec,temp_x_22,  'LineWidth',3, 'color', '[0.0, 0.5, 0.0]')
      hold on
      
     
      
      scatter(data_date,data_i2,'b','LineWidth',1)
      xlim([datetime(data_date(1)),datetime(tvec(length(tvec)))])
      ylim([0 max([temp_x_12;  temp_x_22; temp_x_32; data_i2] + 500)])
      
      ylabel('New cases','FontSize',15)
      
      
      d=0.04; %distance between images
      set(s1,'position',[d      0.1 0.33-d 0.8])
      set(s2,'position',[0.33+d 0.1 0.33-d 0.8])
      set(s3,'position',[0.66+d 0.1 0.33-d 0.8])
     
      

