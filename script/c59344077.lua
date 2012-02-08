--マジック·ドレイン
function c59344077.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_NEGATE+CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_CHAINING)
	e1:SetCondition(c59344077.condition)
	e1:SetOperation(c59344077.activate)
	c:RegisterEffect(e1)
end
function c59344077.condition(e,tp,eg,ep,ev,re,r,rp)
	return rp~=tp and re:IsActiveType(TYPE_SPELL) and re:IsHasType(EFFECT_TYPE_ACTIVATE) and Duel.IsChainInactivatable(ev)
end
function c59344077.activate(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Card.IsType,tp,0,LOCATION_HAND,nil,TYPE_SPELL)
	if g:GetCount()>0 and Duel.IsChainInactivatable(Duel.GetCurrentChain()) and Duel.SelectYesNo(1-tp,aux.Stringid(59344077,0)) then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DISCARD)
		local sg=Duel.SelectMatchingCard(1-tp,Card.IsType,tp,0,LOCATION_HAND,1,1,nil,TYPE_SPELL)
		Duel.SendtoGrave(sg,REASON_EFFECT+REASON_DISCARD)
		return
	end
	Duel.NegateActivation(ev)
	if re:GetHandler():IsRelateToEffect(re) then
		Duel.Destroy(eg,REASON_EFFECT)
	end
end
