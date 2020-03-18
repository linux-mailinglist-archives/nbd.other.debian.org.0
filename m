Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 83801189995
	for <lists+nbd@lfdr.de>; Wed, 18 Mar 2020 11:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 62DCE2072C; Wed, 18 Mar 2020 10:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 18 10:39:09 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MSGID_FROM_MTA_HEADER,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 31F332071D
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 Mar 2020 10:22:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NgMxkR6ybuiN for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 Mar 2020 10:22:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .virtuozzo. - helo: .eur05-vi1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 16381 seconds by postgrey-1.36 at bendel; Wed, 18 Mar 2020 10:22:32 UTC
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2131.outbound.protection.outlook.com [40.107.21.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6A8D52071A
	for <nbd@other.debian.org>; Wed, 18 Mar 2020 10:22:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UG8Jg8MC4HGNslyk669Z64vpHQDkpglL91r5Yd0jNsCwlNMmdxSl/K6Cn543+e3IKNgT8NFHM69eou0UUGY5FgZg7qVGm/Ajvc8fLccMo+rTaOG9OraecUQkonyE73IdVZvgNUADfYcQTgo1f8GgvHAAq2kU7jeynfQCIU4cBma/uqplWGefgzRYr5A64mit5mXYLZ1gJ7P7Xr+maq8/sywl7V7FFm22vBj35Wv5DCejxtCHx99imeBgJRPvCX7HxSDQvt7vM9afxHTlw1Tl/eMi/X7S3i69g0yMsUCsoys5Y5YHJmlO4gn5VslKMR7QeNKETCnaoEZDTOhHIjJBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm+cH8biuvOUjQzwzS8p03jW7ZHPH3qLx7WUGo2kyhQ=;
 b=bYt6pWickGsubImTiQWRTW6lSm2NvN9UO9rxDGFOEBqVjmjP79U1tmLpw8NztdKzkVefK696TwyEJvjCgZAk8hYmZ6lv4aBbEbf57mgP+eUpky/gRwRxFA+OH+6kreMybt1BtR42vDw/WiARbN+cQP/IdfGZxCfTEJFfO9thJ+Dl8/zuE9EPY5VQAJ20t7MjgrNFE1H7kS6xhhO+rF06o9v0lepUQ8flKXAb2hVNVPiAkLaduRjr9n8kppoiZgtOi99dS9y8GE8d4JazgGAW1+vSLxdubh1VzCP0s7dhqJBAOujWmdbWbROPzkWu2INiX1yJXMe7h5CVIYPdLHz+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm+cH8biuvOUjQzwzS8p03jW7ZHPH3qLx7WUGo2kyhQ=;
 b=Px0lrAcgotizjYVzjmcpuT3EkYsPme/2c1+GEvoxszFLKx2ghqB6T38oUluTY/ZxhT04PnvHxr4owfV4p4f1yr+O5hwMUuiAO3szdGAWel0O47t55ddzOMNFNW486fZOXnlziTrILJl/cZCmOeBuW7qG+QIqCz9HlhogaCBlby4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com (10.175.35.136) by
 HE1PR0802MB2587.eurprd08.prod.outlook.com (10.175.34.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18; Wed, 18 Mar 2020 08:49:00 +0000
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f]) by HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f%12]) with mapi id 15.20.2835.017; Wed, 18 Mar
 2020 08:49:00 +0000
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
To: Wouter Verhelst <wouter@grep.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, eblake@redhat.com,
 w@uter.be, nsoffer@redhat.com, den@openvz.org
References: <20200206151547.5812-1-vsementsov@virtuozzo.com>
 <2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com>
 <20200317161859.GD27056@grep.be>
 <fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com>
 <20200318053337.GE27056@grep.be>
 <49e18291-7e7b-a363-c807-80d4cc589fd8@virtuozzo.com>
 <78efe37b-b54b-cc59-aec2-1ce39ec1676b@virtuozzo.com>
 <20200318080454.GH27056@grep.be>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200318114858373
Message-ID: <6520063b-7feb-bf9a-f9ef-2ce3f3ba2240@virtuozzo.com>
Date: Wed, 18 Mar 2020 11:48:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <20200318080454.GH27056@grep.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To HE1PR0802MB2507.eurprd08.prod.outlook.com (2603:10a6:3:e1::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.249) by FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.21 via Frontend Transport; Wed, 18 Mar 2020 08:48:59 +0000
X-Tagtoolbar-Keys: D20200318114858373
X-Originating-IP: [185.215.60.249]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbf3159a-eced-499f-ad55-08d7cb193417
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2587:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2587D958A35C36554B8AC134C1F70@HE1PR0802MB2587.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report:
	SFV:NSPM;SFS:(10019020)(4636009)(376002)(136003)(346002)(39850400004)(366004)(396003)(199004)(66946007)(66476007)(4326008)(16526019)(186003)(956004)(26005)(66556008)(107886003)(478600001)(316002)(16576012)(2906002)(31696002)(31686004)(6486002)(5660300002)(81166006)(8676002)(52116002)(36756003)(86362001)(8936002)(6916009)(81156014)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0802MB2587;H:HE1PR0802MB2507.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VvCCjvoW2iVyGJMyiT27+Tyn2UyLpBcsJs9mKxzjlLMmJN0dyz0EsdiBsFkt/JeEH12AHeN2LHuuFDbWeLUy1AA+jPICR9IA/jY/OZhk/aqKAdACEc4oK5s44BxIWyts8u5ILXzmqU4jmPPQx0O0lxxIL5XxV9W04QrlZiq1Jl1yN/31cMtnmtcKRxtKYyt22cfOdhdsLp5i8q1AL5dM/oWxQmYxFSJJKtBdo+qX03Tc+yEZ+/iV1ze+Ch4RvTj/UYLsVkiYE19H/luXEiBVMryJxTgEEUwSOjESDECoGEpKKWsxT+vzTjc+9bnZI+SHnWqFaoeHBkVluR2hqf8VksnBB0cL/drfXiQl/AfMLIOOKMAN9a9z6uOew1lkFZRyNSluvxnIneK1nyjfI3e1AtGAj6QngDdBAEyMtZoEeAB9BlvpdpS19wOc6p+QJ+PS
X-MS-Exchange-AntiSpam-MessageData:
	GPeMIoNdXrD3sU77xTYginriIDQekA5HCdY+YPk8y9euCEaU1tyE7rRGDXqvCTIckK+VMY7VEpT3R0bdoPyw+X08tZZrBIbb3MuwD5V5gP3AcK0FbDUUZZx+Kt5B76NCTUk1qOKNapIaQAgzUEXUGA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf3159a-eced-499f-ad55-08d7cb193417
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 08:49:00.7401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKzid9F/qVHzOZsrQtd16pNsyUjm+NNo5zGdftXLuxzLIRQYHLkFxhUg8OKto5ahqE0FpqU5cS3qR9XS90ENH5koWnUQTTqp124JX3k8v30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2587
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <j06AXzLdCQI.A.kFH.NpfceB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/865
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6520063b-7feb-bf9a-f9ef-2ce3f3ba2240@virtuozzo.com
Resent-Date: Wed, 18 Mar 2020 10:39:09 +0000 (UTC)

18.03.2020 11:04, Wouter Verhelst wrote:
> On Wed, Mar 18, 2020 at 09:19:45AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> OK, understand. Reasonable thing, agreed. I'll resend.
>>
>> Hmm. But we can't read in one go anyway, because we need to distinguish NBD_REQUEST_MAGIC
>> from NBD_EXTENDED_REQUEST_MAGIC..
> 
> Yes, that needs to happen at any rate, indeed. So the difference will be
> two reads rather than three, instead of one read rather than two.
> 
> That's still an advantage.
> 
>> I think, that modern client will use mostly NBD_EXTENDED_REQUEST_MAGIC interface, so it will
>> be great to optimize it. But to read extended request in one go, we should make it
>> shorter than simple request, and it doesn't seem possible.
>>
>> May be we should not support simple and extended requests together? May be better to force
>> using only extended requests if they are negotiated? Then we will read extended request in
>> on go, and we may just define it like
>>
>> C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
>> C: 16 bits, flags
>> C: 16 bits, type
>> C: 64 bits, handle
>> C: 32 bits, length of payload (unsigned), MUST be greater or equal to 16
>> C: *length* bytes of payload data (if *length* is nonzero)
>>
>> - so, we'll just read 36 bytes in one go, and then additional payload, if length
>> is more than 16.
> 
> That is, certainly, also an option, although I would define length of
> payload to not include the offset and length bytes.
> 

OK.

Eric, what do you think about this all?

-- 
Best regards,
Vladimir

