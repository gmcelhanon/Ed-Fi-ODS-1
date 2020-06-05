﻿// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Autofac;
using EdFi.Ods.Api.Common.Providers;
using EdFi.Ods.Common;

namespace EdFi.Ods.Api.NetCore.Container.Modules
{
    public class ETagModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<ETagProvider>().As<IETagProvider>();
        }
    }
}
