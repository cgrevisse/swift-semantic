import SwiftSyntax

class NodeFinder: SyntaxAnyVisitor {
    
    let start:AbsolutePosition
    let end:AbsolutePosition
    private(set) var node:Syntax? = nil
    
    init(start:AbsolutePosition, end:AbsolutePosition) {
        self.start = start
        self.end = end
    }
    
    override func visitAny(_ node: Syntax) -> SyntaxVisitorContinueKind {
        assert(!node.isUnknown)
        
        // similar to https://git.eclipse.org/r/plugins/gitiles/jdt/eclipse.jdt.core/+/BETA_JAVA13/org.eclipse.jdt.core/dom/org/eclipse/jdt/core/dom/NodeFinder.java
        if node.position.utf8Offset <= start.utf8Offset && end.utf8Offset <= node.endPosition.utf8Offset {
            self.node = node
            return .visitChildren
        } else {
            return .skipChildren
        }
    }
}

class SemanticMapper:SyntaxVisitor {
    
    private(set) var concepts = [String]()
    
    override func visit(_ node: UnknownDeclSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: UnknownExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: UnknownStmtSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: UnknownTypeSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: UnknownPatternSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: CodeBlockItemSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: CodeBlockItemListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: CodeBlockSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: InOutExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:InOutParameter"]
        return .skipChildren
    }
    
    override func visit(_ node: PoundColumnExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: TupleExprElementListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Tuple"]
        return .skipChildren
    }
    
    override func visit(_ node: ArrayElementListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Array"]
        return .skipChildren
    }
    
    override func visit(_ node: DictionaryElementListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Dictionary"]
        return .skipChildren
    }
    
    override func visit(_ node: StringLiteralSegmentsSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:String"]
        return .skipChildren
    }
    
    override func visit(_ node: TryExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:try"]
        return .skipChildren
    }
    
    override func visit(_ node: DeclNameArgumentSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DeclNameArgumentListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DeclNameArgumentsSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: IdentifierExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: SuperRefExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:super"]
        return .skipChildren
    }
    
    override func visit(_ node: NilLiteralExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:nil"]
        return .skipChildren
    }
    
    override func visit(_ node: DiscardAssignmentExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AssignmentExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:AssignmentOperator"]
        return .skipChildren
    }
    
    override func visit(_ node: SequenceExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ExprListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PoundLineExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PoundFileExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PoundFilePathExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PoundFunctionExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PoundDsohandleExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: SymbolicReferenceExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PrefixOperatorExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: BinaryOperatorExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Operator"]
        return .skipChildren
    }
    
    override func visit(_ node: ArrowExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: FloatLiteralExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Float"]
        return .skipChildren
    }
    
    override func visit(_ node: TupleExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Tuple"]
        return .skipChildren
    }
    
    override func visit(_ node: ArrayExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Array"]
        return .skipChildren
    }
    
    override func visit(_ node: DictionaryExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Dictionary"]
        return .skipChildren
    }
    
    override func visit(_ node: TupleExprElementSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Tuple"]
        return .skipChildren
    }
    
    override func visit(_ node: ArrayElementSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Array"]
        return .skipChildren
    }
    
    override func visit(_ node: DictionaryElementSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Dictionary"]
        return .skipChildren
    }
    
    override func visit(_ node: IntegerLiteralExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Int"]
        return .skipChildren
    }
    
    override func visit(_ node: BooleanLiteralExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Bool"]
        return .skipChildren
    }
    
    override func visit(_ node: TernaryExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:TernaryConditionalOperator"]
        return .skipChildren
    }
    
    override func visit(_ node: MemberAccessExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: IsExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:TypeCheckOperator"]
        return .skipChildren
    }
    
    override func visit(_ node: AsExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:TypeCastOperator"]
        return .skipChildren
    }
    
    override func visit(_ node: TypeExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ClosureCaptureItemSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Closure"]
        return .skipChildren
    }
    
    override func visit(_ node: ClosureCaptureItemListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Closure"]
        return .skipChildren
    }
    
    override func visit(_ node: ClosureCaptureSignatureSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Closure"]
        return .skipChildren
    }
    
    override func visit(_ node: ClosureParamSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Closure"]
        return .skipChildren
    }
    
    override func visit(_ node: ClosureParamListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Closure"]
        return .skipChildren
    }
    
    override func visit(_ node: ClosureSignatureSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Closure"]
        return .skipChildren
    }
    
    override func visit(_ node: ClosureExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Closure"]
        return .skipChildren
    }
    
    override func visit(_ node: UnresolvedPatternExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: FunctionCallExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Function"]
        return .skipChildren
    }
    
    override func visit(_ node: SubscriptExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Subscript"]
        return .skipChildren
    }
    
    override func visit(_ node: OptionalChainingExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:OptionalChaining"]
        return .skipChildren
    }
    
    override func visit(_ node: ForcedValueExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:ForcedUnwrapping"]
        return .skipChildren
    }
    
    override func visit(_ node: PostfixUnaryExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: SpecializeExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: StringSegmentSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:String"]
        return .skipChildren
    }
    
    override func visit(_ node: ExpressionSegmentSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: StringLiteralExprSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:String"]
        return .skipChildren
    }
    
    override func visit(_ node: KeyPathExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: KeyPathBaseExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ObjcNamePieceSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ObjcNameSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ObjcKeyPathExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ObjcSelectorExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: EditorPlaceholderExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ObjectLiteralExprSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: TypeInitializerClauseSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: TypealiasDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:TypeAlias"]
        return .skipChildren
    }
    
    override func visit(_ node: AssociatedtypeDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:AssociatedType"]
        return .skipChildren
    }
    
    override func visit(_ node: FunctionParameterListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Parameter"]
        return .skipChildren
    }
    
    override func visit(_ node: ParameterClauseSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Parameter"]
        return .skipChildren
    }
    
    override func visit(_ node: ReturnClauseSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:return"]
        return .skipChildren
    }
    
    override func visit(_ node: FunctionSignatureSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: IfConfigClauseSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: IfConfigClauseListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: IfConfigDeclSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PoundErrorDeclSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PoundWarningDeclSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PoundSourceLocationSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PoundSourceLocationArgsSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DeclModifierSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: InheritedTypeSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Inheritance"]
        return .skipChildren
    }
    
    override func visit(_ node: InheritedTypeListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Inheritance"]
        return .skipChildren
    }
    
    override func visit(_ node: TypeInheritanceClauseSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ClassDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Class"]
        return .skipChildren
    }
    
    override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Struct"]
        return .skipChildren
    }
    
    override func visit(_ node: ProtocolDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Protocol"]
        return .skipChildren
    }
    
    override func visit(_ node: ExtensionDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Extension"]
        return .skipChildren
    }
    
    override func visit(_ node: MemberDeclBlockSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: MemberDeclListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: MemberDeclListItemSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: SourceFileSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Module"]
        return .skipChildren
    }
    
    override func visit(_ node: InitializerClauseSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Initializer"]
        return .skipChildren
    }
    
    override func visit(_ node: FunctionParameterSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Parameter"]
        return .skipChildren
    }
    
    override func visit(_ node: ModifierListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: FunctionDeclSyntax) -> SyntaxVisitorContinueKind {
        var isMethod = false
        if let parent = node.parent {
            if parent.asProtocol(SyntaxProtocol.self) is MemberDeclListItemSyntax {
                isMethod = true
            }
        }
        
        self.concepts += ["swift:\(isMethod ? "Method" : "Function")"]
        return .skipChildren
    }
    
    override func visit(_ node: InitializerDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Initializer"]
        return .skipChildren
    }
    
    override func visit(_ node: DeinitializerDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Deinitializer"]
        return .skipChildren
    }
    
    override func visit(_ node: SubscriptDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Subscript"]
        return .skipChildren
    }
    
    override func visit(_ node: AccessLevelModifierSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:AccessControl"]
        return .skipChildren
    }
    
    override func visit(_ node: AccessPathComponentSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AccessPathSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ImportDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:import"]
        return .skipChildren
    }
    
    override func visit(_ node: AccessorParameterSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AccessorDeclSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AccessorListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AccessorBlockSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PatternBindingSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PatternBindingListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: VariableDeclSyntax) -> SyntaxVisitorContinueKind {
        var isProperty = false
        if let parent = node.parent {
            if parent.asProtocol(SyntaxProtocol.self) is MemberDeclListItemSyntax {
                isProperty = true
            }
        }
        
        self.concepts += ["swift:\(isProperty ? "Property" : "Variable")"]
        return .skipChildren
    }
    
    override func visit(_ node: EnumCaseElementSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Enumeration"]
        return .skipChildren
    }
    
    override func visit(_ node: EnumCaseElementListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Enumeration"]
        return .skipChildren
    }
    
    override func visit(_ node: EnumCaseDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Enumeration"]
        return .skipChildren
    }
    
    override func visit(_ node: EnumDeclSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Enumeration"]
        return .skipChildren
    }
    
    override func visit(_ node: OperatorDeclSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: IdentifierListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: OperatorPrecedenceAndTypesSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PrecedenceGroupDeclSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PrecedenceGroupAttributeListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PrecedenceGroupRelationSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PrecedenceGroupNameListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PrecedenceGroupNameElementSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PrecedenceGroupAssignmentSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: PrecedenceGroupAssociativitySyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: TokenListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: NonEmptyTokenListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: CustomAttributeSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AttributeSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Attribute"]
        return .skipChildren
    }
    
    override func visit(_ node: AttributeListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Attribute"]
        return .skipChildren
    }
    
    override func visit(_ node: SpecializeAttributeSpecListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: LabeledSpecializeEntrySyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: NamedAttributeStringArgumentSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DeclNameSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ImplementsAttributeArgumentsSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ObjCSelectorPieceSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ObjCSelectorSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DifferentiableAttributeArgumentsSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DifferentiationParamsClauseSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DifferentiationParamsSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DifferentiationParamListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DifferentiationParamSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DifferentiableAttributeFuncSpecifierSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: FunctionDeclNameSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ContinueStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:continue"]
        return .skipChildren
    }
    
    override func visit(_ node: WhileStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:WhileLoop"]
        return .skipChildren
    }
    
    override func visit(_ node: DeferStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:defer"]
        return .skipChildren
    }
    
    override func visit(_ node: ExpressionStmtSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: SwitchCaseListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Switch"]
        return .skipChildren
    }
    
    override func visit(_ node: RepeatWhileStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:RepeatWhileLoop"]
        return .skipChildren
    }
    
    override func visit(_ node: GuardStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Guard"]
        return .skipChildren
    }
    
    override func visit(_ node: WhereClauseSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:where"]
        return .skipChildren
    }
    
    override func visit(_ node: ForInStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:ForInLoop"]
        return .skipChildren
    }
    
    override func visit(_ node: SwitchStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Switch"]
        return .skipChildren
    }
    
    override func visit(_ node: CatchClauseListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:catch"]
        return .skipChildren
    }
    
    override func visit(_ node: DoStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:do"]
        return .skipChildren
    }
    
    override func visit(_ node: ReturnStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:return"]
        return .skipChildren
    }
    
    override func visit(_ node: YieldStmtSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: YieldListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: FallthroughStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:fallthrough"]
        return .skipChildren
    }
    
    override func visit(_ node: BreakStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:break"]
        return .skipChildren
    }
    
    override func visit(_ node: CaseItemListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ConditionElementSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AvailabilityConditionSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: MatchingPatternConditionSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: OptionalBindingConditionSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:OptionalBinding"]
        return .skipChildren
    }
    
    override func visit(_ node: ConditionElementListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: DeclarationStmtSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ThrowStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:throw"]
        return .skipChildren
    }
    
    override func visit(_ node: IfStmtSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:If"]
        return .skipChildren
    }
    
    override func visit(_ node: ElseIfContinuationSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:If"]
        return .skipChildren
    }
    
    override func visit(_ node: ElseBlockSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:If"]
        return .skipChildren
    }
    
    override func visit(_ node: SwitchCaseSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Switch"]
        return .skipChildren
    }
    
    override func visit(_ node: SwitchDefaultLabelSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Switch"]
        return .skipChildren
    }
    
    override func visit(_ node: CaseItemSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Switch"]
        return .skipChildren
    }
    
    override func visit(_ node: SwitchCaseLabelSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Switch"]
        return .skipChildren
    }
    
    override func visit(_ node: CatchClauseSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:catch"]
        return .skipChildren
    }
    
    override func visit(_ node: PoundAssertStmtSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: GenericWhereClauseSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:GenericWhereClause"]
        return .skipChildren
    }
    
    override func visit(_ node: GenericRequirementListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Generics"]
        return .skipChildren
    }
    
    override func visit(_ node: GenericRequirementSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Generics"]
        return .skipChildren
    }
    
    override func visit(_ node: SameTypeRequirementSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: GenericParameterListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Generics"]
        return .skipChildren
    }
    
    override func visit(_ node: GenericParameterSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Generics"]
        return .skipChildren
    }
    
    override func visit(_ node: GenericParameterClauseSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Generics"]
        return .skipChildren
    }
    
    override func visit(_ node: ConformanceRequirementSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: SimpleTypeIdentifierSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: MemberTypeIdentifierSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ClassRestrictionTypeSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: ArrayTypeSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Array"]
        return .skipChildren
    }
    
    override func visit(_ node: DictionaryTypeSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Dictionary"]
        return .skipChildren
    }
    
    override func visit(_ node: MetatypeTypeSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: OptionalTypeSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Optional"]
        return .skipChildren
    }
    
    override func visit(_ node: SomeTypeSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:OpaqueType"]
        return .skipChildren
    }
    
    override func visit(_ node: ImplicitlyUnwrappedOptionalTypeSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: CompositionTypeElementSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: CompositionTypeElementListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: CompositionTypeSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: TupleTypeElementSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Tuple"]
        return .skipChildren
    }
    
    override func visit(_ node: TupleTypeElementListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Tuple"]
        return .skipChildren
    }
    
    override func visit(_ node: TupleTypeSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Tuple"]
        return .skipChildren
    }
    
    override func visit(_ node: FunctionTypeSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:FunctionType"]
        return .skipChildren
    }
    
    override func visit(_ node: AttributedTypeSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: GenericArgumentListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Generics"]
        return .skipChildren
    }
    
    override func visit(_ node: GenericArgumentSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Generics"]
        return .skipChildren
    }
    
    override func visit(_ node: GenericArgumentClauseSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Generics"]
        return .skipChildren
    }
    
    override func visit(_ node: TypeAnnotationSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:TypeAnnotation"]
        return .skipChildren
    }
    
    override func visit(_ node: EnumCasePatternSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Enumeration"]
        return .skipChildren
    }
    
    override func visit(_ node: IsTypePatternSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:is"]
        return .skipChildren
    }
    
    override func visit(_ node: OptionalPatternSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Optional"]
        return .skipChildren
    }
    
    override func visit(_ node: IdentifierPatternSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AsTypePatternSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:TypeCastOperator"]
        return .skipChildren
    }
    
    override func visit(_ node: TuplePatternSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Tuple"]
        return .skipChildren
    }
    
    override func visit(_ node: WildcardPatternSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: TuplePatternElementSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Tuple"]
        return .skipChildren
    }
    
    override func visit(_ node: ExpressionPatternSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: TuplePatternElementListSyntax) -> SyntaxVisitorContinueKind {
        self.concepts += ["swift:Tuple"]
        return .skipChildren
    }
    
    override func visit(_ node: ValueBindingPatternSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AvailabilitySpecListSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AvailabilityArgumentSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AvailabilityLabeledArgumentSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: AvailabilityVersionRestrictionSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: VersionTupleSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ token: TokenSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
    override func visit(_ node: UnknownSyntax) -> SyntaxVisitorContinueKind {
        return .skipChildren
    }
    
}
