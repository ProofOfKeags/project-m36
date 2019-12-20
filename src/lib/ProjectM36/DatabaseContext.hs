module ProjectM36.DatabaseContext where
import ProjectM36.Base
import qualified Data.Map as M
import qualified Data.HashSet as HS
import ProjectM36.DataTypes.Basic
import ProjectM36.AtomFunctions.Basic
import ProjectM36.DatabaseContextFunction
import ProjectM36.Relation

empty :: DatabaseContext
empty = DatabaseContext { inclusionDependencies = M.empty, 
                          relationVariables = M.empty, 
                          notifications = M.empty,
                          atomFunctions = HS.empty,
                          dbcFunctions = HS.empty,
                          typeConstructorMapping = [] }
        
-- | convert an existing database context into its constituent expression.   
databaseContextAsDatabaseContextExpr :: DatabaseContext -> DatabaseContextExpr
databaseContextAsDatabaseContextExpr _ = unimplemented {-MultipleExpr $ relVarsExprs ++ incDepsExprs ++ funcsExprs
  where
    relVarsExprs = map (\(name, rel) -> --Assign name (ExistingRelation rel)) (M.toList (relationVariables context))
    incDepsExprs :: [DatabaseContextExpr]
    incDepsExprs = map (uncurry AddInclusionDependency) (M.toList (inclusionDependencies context))
    funcsExprs = [] -- map (\func -> ) (HS.toList funcs) -- there are no databaseExprs to add atom functions yet-}

basicDatabaseContext :: DatabaseContext
basicDatabaseContext = DatabaseContext { inclusionDependencies = M.empty,
                                         relationVariables = M.fromList [("true", ExistingRelation relationTrue),
                                                                         ("false", ExistingRelation relationFalse)],
                                         atomFunctions = basicAtomFunctions,
                                         dbcFunctions = basicDatabaseContextFunctions,
                                         notifications = M.empty,
                                         typeConstructorMapping = basicTypeConstructorMapping
                                         }
