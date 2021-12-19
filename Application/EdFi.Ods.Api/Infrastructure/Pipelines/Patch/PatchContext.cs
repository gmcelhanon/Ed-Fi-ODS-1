// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using EdFi.Ods.Api.Infrastructure.Pipelines.Put;
using EdFi.Ods.Api.Models;
using EdFi.Ods.Common;

namespace EdFi.Ods.Api.Infrastructure.Pipelines.Patch
{
    public class PatchContext<TResourceModel, TEntityModel> : IHasPersistentModel<TEntityModel>, IHasResource<TResourceModel>, IHasIdentifier, IPersistenceContext<TEntityModel>
    
        where TResourceModel : IHasETag
        where TEntityModel : class, IHasIdentifier
    {
        private readonly ValidationState _validationState;

        public PatchContext(EdFiJsonPatchRequest patchRequest, ValidationState validationState)
            : this(patchRequest, validationState, null) { }

        public PatchContext(EdFiJsonPatchRequest patchRequest, ValidationState validationState, string etagValue)
        {
            _validationState = validationState;
            PatchRequest = patchRequest;
            ETagValue = etagValue;
        }

        public string ETagValue { get; set; }

        public bool? IsValid
        {
            get { return _validationState.IsValid; }
            set { _validationState.IsValid = value; }
        }

        public bool EnforceOptimisticLock
        {
            get { return PatchRequest.ETag != null; }
        }

        public Guid Id
        {
            get { return PersistentModel.Id; }
            set { throw new NotImplementedException("Cannot set the identifier of the persistent model through the context."); }
        }

        public TEntityModel SpecificationModel { get; set; }
        
        public TEntityModel PersistentModel { get; set; }

        public TResourceModel Resource { get; set; }
        
        public EdFiJsonPatchRequest PatchRequest { get; set; }
    }
}
