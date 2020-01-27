// STAR-CCM+ macro: part1bAutoDomainChange.java
// Written by STAR-CCM+ 13.04.011
package macro;

import java.util.*;

import star.common.*;
import star.base.neo.*;
import star.base.report.*;
import star.vis.*;
import star.cadmodeler.*;
import star.flow.*;
import star.meshing.*;

public class part1bAutoDomainChange extends StarMacro {

  public void execute() {
    execute0(150.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd150.csv");
    execute0(130.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd130.csv");
    execute0(100.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd100.csv");
    execute0(80.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd80.csv");
    execute0(60.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd60.csv");
    execute0(50.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd50.csv");
    execute0(40.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd40.csv");
    execute0(30.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd30.csv");
    execute0(20.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd20.csv");
    execute0(10.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd10.csv");
    execute0(8.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd8.csv");
    execute0(5.0,"\\\\icnas3.cc.ic.ac.uk\\nmd16\\ComputationalAerodynamicsSandbox\\aca-docker\\files\\coursework\\part2\\star files\\Macros\\Macro Data\\ClCd5.csv");
  }

  private void execute0(double width, String file) {

    Simulation simulation_0 = 
      getActiveSimulation();

    Scene scene_0 = 
      simulation_0.getSceneManager().createScene("3D-CAD View");

    scene_0.initializeAndWait();

    CadModel cadModel_0 = 
      ((CadModel) simulation_0.get(SolidModelManager.class).getObject("3D-CAD Model 1"));

    simulation_0.get(SolidModelManager.class).editCadModel(cadModel_0, scene_0);

    scene_0.open();

    scene_0.setAdvancedRenderingEnabled(false);

    SceneUpdate sceneUpdate_0 = 
      scene_0.getSceneUpdate();

    HardcopyProperties hardcopyProperties_0 = 
      sceneUpdate_0.getHardcopyProperties();

    hardcopyProperties_0.setCurrentResolutionWidth(25);

    hardcopyProperties_0.setCurrentResolutionHeight(25);

    Scene scene_1 = 
      simulation_0.getSceneManager().getScene("Mesh Scene 1");

    SceneUpdate sceneUpdate_1 = 
      scene_1.getSceneUpdate();

    HardcopyProperties hardcopyProperties_1 = 
      sceneUpdate_1.getHardcopyProperties();

    hardcopyProperties_1.setCurrentResolutionWidth(1332);

    hardcopyProperties_1.setCurrentResolutionHeight(619);

    hardcopyProperties_0.setCurrentResolutionWidth(1330);

    hardcopyProperties_0.setCurrentResolutionHeight(618);

    scene_0.resetCamera();

    CylinderPrimitiveFeature cylinderPrimitiveFeature_0 = 
      ((CylinderPrimitiveFeature) cadModel_0.getFeature("Cylinder 1"));

    cadModel_0.getFeatureManager().rollBack(cylinderPrimitiveFeature_0);

    Units units_0 = 
      simulation_0.getUnitsManager().getPreferredUnits(new IntVector(new int[] {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}));

    LabCoordinateSystem labCoordinateSystem_0 = 
      simulation_0.getCoordinateSystemManager().getLabCoordinateSystem();

    cylinderPrimitiveFeature_0.setCoordinateSystem(labCoordinateSystem_0);

    CadModelCoordinate cadModelCoordinate_0 = 
      cylinderPrimitiveFeature_0.getCenter();

    cadModelCoordinate_0.setCoordinateSystem(labCoordinateSystem_0);

    cadModelCoordinate_0.setCoordinate(units_0, units_0, units_0, new DoubleVector(new double[] {0.0, 0.0, 0.0}));

    cylinderPrimitiveFeature_0.getRadius().setValue(width);

    cylinderPrimitiveFeature_0.markFeatureForEdit();

    cadModel_0.getFeatureManager().markDependentNotUptodate(cylinderPrimitiveFeature_0);

    cadModel_0.getFeatureManager().rollForwardToEnd();

    cadModel_0.update();

    simulation_0.get(SolidModelManager.class).endEditCadModel(cadModel_0);

    simulation_0.getSceneManager().deleteScenes(new NeoObjectVector(new Object[] {scene_0}));

    hardcopyProperties_1.setCurrentResolutionWidth(1330);

    hardcopyProperties_1.setCurrentResolutionHeight(618);

    MeshPipelineController meshPipelineController_0 = 
      simulation_0.get(MeshPipelineController.class);

    meshPipelineController_0.generateVolumeMesh();

    ResidualPlot residualPlot_0 = 
      ((ResidualPlot) simulation_0.getPlotManager().getPlot("Residuals"));

    residualPlot_0.open();

    Solution solution_0 = 
      simulation_0.getSolution();

    solution_0.clearSolution(Solution.Clear.History, Solution.Clear.Fields, Solution.Clear.LagrangianDem);

    simulation_0.getSimulationIterator().runAutomation();

    MonitorPlot monitorPlot_0 = 
      ((MonitorPlot) simulation_0.getPlotManager().getPlot("Lift and Drag coefficient"));

    Cartesian2DAxisManager cartesian2DAxisManager_0 = 
      ((Cartesian2DAxisManager) monitorPlot_0.getAxisManager());

    cartesian2DAxisManager_0.setAxesBounds(new Vector(Arrays.asList(new star.common.AxisManager.AxisBounds("Bottom Axis", 1.0, false, 1000.0, false), new star.common.AxisManager.AxisBounds("Left Axis", -0.05371483835076627, false, 3.050702382807832, false))));

    monitorPlot_0.export(resolvePath(file), ",");
  }
}
