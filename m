Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6DFA0763D
	for <lists+nbd@lfdr.de>; Thu,  9 Jan 2025 13:57:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5E718205DD; Thu,  9 Jan 2025 12:57:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan  9 12:57:10 2025
Old-Return-Path: <john.g.garry@oracle.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LONGWORD,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1162D20604
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Jan 2025 12:41:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LONGWORD=2,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eNXsam9FpIsT for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Jan 2025 12:41:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 4058 seconds by postgrey-1.36 at bendel; Thu, 09 Jan 2025 12:41:29 UTC
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 75E80205E0
	for <nbd@other.debian.org>; Thu,  9 Jan 2025 12:41:29 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5098mL1s027356;
	Thu, 9 Jan 2025 11:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=IlooJFjtA8P1Hbc8h9aJHMel0zTEhZC1NZCueFsARMg=; b=
	bxjUHlk7jrN5X7DwwGPRr/zYwykeuc6CyID02GhORETSYjlKQY1y7JKccxCigEgG
	s5Hqx2ZSGTvPGwxdbBZXzusWkKJ58APXe1cCSpGJFx2eAk6pOsIF6levlyj5MPRc
	eBcwkkdIgnIGriGjxHHAjBjXFxWJY/KMe3fCHNXn4ihnlv+H5e/EVBgzbhL5WcEG
	O2e5I1aLAiLh4BYg/RUrBIra9vLzRt7n5z8NzxOYYVDBes9niCCYVqAcbjLiNcbz
	SiXv5I2lngWK+wVbfZQd7pQ9xxzuf9onbwVA1aoJ3CFtbrKoaRy247YwMsnAPhTp
	Oyr8/R/BNxL4BHVZGeQ58g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442b8ug7wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jan 2025 11:33:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509A17x2020955;
	Thu, 9 Jan 2025 11:33:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xueayd68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jan 2025 11:33:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDzebqvKvAzbLp0CRmn/TnPtDzKXoBsv5rKif2lzsi2R2JKu1P/dYwJ8cu/OdXiFN1ZKyQieShJ7LF4ENYuiKnKekvhNxWDErLR1eH0l/ei/6ijMMa+Ait1VhrpSb8TaZzSfQ9Yblij3HUP4qVNJBD4d3sj9EdT/FixT0pEiQbn0IhPIFUBKV6jyimsuzBzm+RVCloG6iLLF04hJjkA+0VQ+ys5hgrLERj4CVfnsdlu94z5MJjk0mlsQK6w18e5LGVSNkBKWylEBk6cWlOwiXdaTBl+ald3E8OcLKRQ8brZdFr9WFHPiv5eD6KBzgLcDpGmFAgYDx+ovhsjQ5km0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlooJFjtA8P1Hbc8h9aJHMel0zTEhZC1NZCueFsARMg=;
 b=ObbD58I4BqmghO64TXph/EQ+xzlGu4L19AMh9suT0+R2jD5Sj7pJWhsRbHO5CLlH9YIvOgLfORaUs9ao1FXHpnYQFiLb4DqjgdBt1dSDdXtPpAk3uRs+20xjUkQ8bCl0bOlz2NKSZf+0JiVrgKDb6PFKH56WhcTjOpm6QeUYI5nKKnRS4TzB4YRpOX/C6VUqdbLHcrz58gF4f5Nvj00wnZ3J9nPvTl4eNrPzFeMuTNz3/NSw7POUHm3t0H9zs4SXZmJONKXWAaE36OBit5qZYNfZ2MbO6BUUsO+oatuSXqKDxGtlu4b/SBqcg/HbXt5BGxPNGWOxTJidjIDjBJy3ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlooJFjtA8P1Hbc8h9aJHMel0zTEhZC1NZCueFsARMg=;
 b=fBJ10hghcuVvWJkFlMmK9l8Zk31BAcNGXfzDcYr1gFXkuPbcZtEO01jBW9Mu6OYlTSQCjlAu+DkSCEZKsYUhm/9Nox7QJGqLCeZWJwTyJlKd6tgK+VTqQ2vSODPeuUu8AcI9ZgYG/Kd0qkLL3Bvp902MtUWGQUCKXn89odI1FsA=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by BL3PR10MB6067.namprd10.prod.outlook.com (2603:10b6:208:3b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 11:33:33 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 11:33:33 +0000
Message-ID: <fd048cd8-1c81-4346-8f8c-75c7dcd29008@oracle.com>
Date: Thu, 9 Jan 2025 11:33:29 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] block: add a queue_limits_commit_update_frozen
 helper
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
        Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
        linux-nvme@lists.infradead.org, nbd@other.debian.org,
        linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <20250109055810.1402918-1-hch@lst.de>
 <20250109055810.1402918-3-hch@lst.de>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20250109055810.1402918-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::31) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|BL3PR10MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b4c48b1-3d3f-4c43-4778-08dd30a172c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3pxNDUxeDJ3TEpYY2IxOTlyRmVpUmFVOEh0aSsrY1pHNytZR2ZDVmp5ZjNj?=
 =?utf-8?B?T0pBSUx3VjVFYjdpLzRkNG9MWjBSaXN0cmRENVNwMnJsZzhzb3kvQ0hZdDRn?=
 =?utf-8?B?eVpUY1NqRENLdDFHNE9tdlIyRDlLejVKNTVvRVNjUG44V1JRNXhLbG9kRHFh?=
 =?utf-8?B?UUpMWllKaFNVZHdDS05xRENsSWVwQjJFaUNYRmRiMXNCOUNGTXN4aUgyVXNF?=
 =?utf-8?B?YWRkN0FtdkUwekp6YmVSV2dnc1NTSU4veGxYcGtSMmhTUWFySFdldmJsTHpB?=
 =?utf-8?B?d05rUDA5aDlKYmUwS2tYS2d1T3JROXZJSU8yTXdBZG1ZV28wd0Y3VXpDa2tZ?=
 =?utf-8?B?NTBKYWZjeWxhZXh1b2tFR0FKVHgvR3lYUzZpWXpNNVIxWTVmQ3BvYTFaeEJF?=
 =?utf-8?B?OFdzOHh6cTZrd2VHQVFGSGVQSWFHY0JtbENicVRFYXZLa1BvOE5rZmxOUDBQ?=
 =?utf-8?B?L3R0cWtUV2xVdFVNT0ZBNnA1T1lWU3JVeGlHR04rSXlaeDRlTHRtOVV6dHFO?=
 =?utf-8?B?RDluTmEwVGc5YkFlRVNYQThOOXpXeW04a2xrV0tMWE83ajRVYzI0T2tSS3lW?=
 =?utf-8?B?ejFtVXZJbTB6c1I1azB2T1duZ1phOUtZZHI2cGtpYlpZOEFvUWZ6NGZtT0xI?=
 =?utf-8?B?ZDVJSGRrSjEzMzRyNlhqWklTTHc2aHkwYUZrV3EvZWdQczEyMFNPWnZubEhE?=
 =?utf-8?B?ZkRnUjNhVVVyR3NMdWlTV1cxUGlNbC8wekZpV2N6SDhLYnBPQzE3T0hzV2Vp?=
 =?utf-8?B?Q0V3ckkvS0ZJOWtqSU5IRnA0SVhTaWxtUG02c2FuVjhwVDVyZFRFU0lFbFhj?=
 =?utf-8?B?RmJTb2Y3dUFVaHU5Z0dodXBuWmlpcjdhWDYzVEJINGhlWll2cnk3azdEYVNN?=
 =?utf-8?B?UUNqelVBQzdGdXFablFzOHZlYk5DUDhLR1VtK0EwZG9HOGIrL3NNQ1NOZlp4?=
 =?utf-8?B?amZnQnRVTWkzTUU5MUVPMWlSdUswSXZLZTB6OHJ5cGhmcTQ5eW9VdjN3VUFn?=
 =?utf-8?B?ZmI3UnVjT1FEQ0lPUzZnNk9kTTZYM2hrRkpXRE1CeUhJKzhuT0c4SnpaZlB2?=
 =?utf-8?B?VENyRkRPSlprc1NXTFpUaHNvSDBJa0FaU2g3aTVIWG1mbzF0ODJrZlJLdWx5?=
 =?utf-8?B?UXJFNlFZM3FnS09qZjRlazFoWUg3dkNhdFB3UVlzZkNRNG9vZEM5SytWY2Ju?=
 =?utf-8?B?ZzRYUXdiMlAxWnpJWWdNNldHNFdISzlwUWVkdjc3b3NBZWx6U290M3BORmdM?=
 =?utf-8?B?QXQ3MHhWNHhqRHR0SHBYSGhwbU8raWwxMFpHMmJNWnJMbmxVQ0dvbXp5bFZ4?=
 =?utf-8?B?U01pdUFDS1dNV3UwMjYyQ0dQeVhZaGhMaVlmK1VMNitGZkVieFBQL3ozWjdG?=
 =?utf-8?B?RnBFSW50WWNYMjJ1QkhqNGtpc2o3TUFoMjFUd1JmUjZkeWtCYVA3b25YMnhG?=
 =?utf-8?B?MkRrOEJOaU9LbFFnMXA2bHdvQUVOSnB3ZVdEODlscnY3QXYyMHIwamloVU1T?=
 =?utf-8?B?YVhqdGpGWDZ5ZkhrRkZzMlpoSURVcnRnOUUzeDBKMFVUa3hBdXM3Vllic1lq?=
 =?utf-8?B?eVFPRXNMQmdoc09KTHlHK1J6aVRaMC9HeVlpQWFLL0FZS3Q3RlBBT2JZYmxt?=
 =?utf-8?B?NnJ5QVJTOWFaNlZ3ZUNSRGlOS0o1ZlJuaUZ3aks1MEVkMW9SeE1WbnhLUFFJ?=
 =?utf-8?B?M1VaNzRLdUZUL0xJTDN4VytRSWw0b2VwR3M4eXlKR3pvc282RFUxamNXYi83?=
 =?utf-8?B?ekE3VnBmSGNVaHhVWlZ3aU1MRTUwczFsNm5pcXMzWFZ5UTFVTHhRM2xmendD?=
 =?utf-8?B?aTgwOWQva3ZSQzZ0YjUzdWN3NVl5NlFaNmdLNHhnaTBlOEs2SnEwWS8xR3FR?=
 =?utf-8?Q?KPLbkjACXWwU2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXFUVytTQWdHWDZGeTI1RWNTYVRVZUlUd09aZ01heUh4MGEzQzZTVGpFZSt4?=
 =?utf-8?B?cURjcGpLRVFqYjlzTjYzeUxxU05WRlpEYmlVYkJtM1dNRHoxOGZtZUV6T2Ex?=
 =?utf-8?B?ekRIVEU0bjdVVm92a2NBWlJ6WFQyZWR5OHpUbUZ1bC9kZnZXS0hKME5FQURu?=
 =?utf-8?B?YlRTNllnV1VQTEI1YTg1aXdaZHIydUVnb1FCbjJEUlBubzAyOGxDMHF4a2h0?=
 =?utf-8?B?blRjYndFR2MyWWlVWTQzbW1NSVJlZDArVUtjOUhncUhnQ0pVMUhaaWxFcEJ4?=
 =?utf-8?B?TFJKVWsvc1lWMHJyanpQbzlMOTEvM2hJUmlGMkRWdDBwYmdBZlJTTkM3N2h6?=
 =?utf-8?B?cStYNytlOFZid201cys5TFN4NEU4b0hNZG1LRXFTaEJCU3VaTG1GQVRuV1FJ?=
 =?utf-8?B?MENMS3puN0ZIeWxNSjJmaHpvdDRKU2w2dWw3NzJkbzRRS01MajluWUorME1q?=
 =?utf-8?B?STVQeXdDMXMyYlFZemo4azdTVndYM0dEZTVOQm1jb09TSis3a0pCSUozSjNM?=
 =?utf-8?B?czBoenJ0TGdUbGhrbE9kVFFnSS9pUkdqc2RBZkxrcHVOYzUrd1hHQnJTOG1U?=
 =?utf-8?B?NGQzVUo3Smk1ZEZiRWhnb042T3NZd2gyR3BNcDJXaEdBMzRvZVJvODh0RkFY?=
 =?utf-8?B?b2dLcDNtcVMzVU5teno0bXpBZFVvODF2cnJhRkEzL3hkR2NwRmFOdkp5Y2o5?=
 =?utf-8?B?TEJFcktEc21vNmh6Sy9CY3BERGhhV1dwNTRFT2FnVUR0UnMxazFlK3hBQjI1?=
 =?utf-8?B?dVhuTXdXUmtCem9RRGdzNHRTczYxS0NLdGtPdmd6cTUwcXVIbUljNWJndmZF?=
 =?utf-8?B?M3pJUmduTU9uODdVTVhYbkRwRmMrOUx6N3huNHUvY0RxRXVPRHJueHhzVytM?=
 =?utf-8?B?RHVjZnJIVlFRN2xPRjdwbS9BUENwMzZ1TTk5R01MVGhkTEUzY2hndnBMK2wz?=
 =?utf-8?B?dktTVHIrNitIU0h1a3Z5WmFoQ1ZoMldMZGhKRkdJSUUvRHQwYUhXbkNMWEF5?=
 =?utf-8?B?MmpkZ0hoQ0dTRUdZN2lwcm5EVFJkRkpEQzVQVFpIZjZ3WmxnVy9PKzVFTU1m?=
 =?utf-8?B?WnVyeVMzQzlXbjE2bUlHWVpaait4M1FPQ2kxOXJ0ZHZreVphOFY5c1JVQUVp?=
 =?utf-8?B?bmpBWEtSRWwxektyZk9yNTUvRkxiMlg2c1owbGp4YmJXRkZTaFgyVUhxcG84?=
 =?utf-8?B?NjNvUVd5eTV5UXJ2ZVpqaE9meDFCazJ6MFE3akw4RXg4QzFvaWU1bXIram5X?=
 =?utf-8?B?dWM2eW1hU0pzdW0xQ01aWU53cEFuYUplV1d5UVZaVTQ0bURpaVVoMmJpUXNZ?=
 =?utf-8?B?dzY5dG5DY1NZL1lvN1NoS21yakhrb0hMU05FS3UzOUFPc2MxUHNOb1VMNzh3?=
 =?utf-8?B?ZWFpZmdCVkVwdmVmVytySStwQXBQa0xGc0prdlE3SURSUnBlNkJxV1RqUGNU?=
 =?utf-8?B?eEZNRlh4QzlidjNLclBoUktVK2w0NldHZkk2WmFuSmVqU0tKZDVBNCt0dW5x?=
 =?utf-8?B?T3pMQUYzczlCZGIrRkI1d1RkbERuWVNhZUtaQ2JCcjhFTkdqcXdaS0M2MS8w?=
 =?utf-8?B?NDdrMU9zMitERVgreUtIVms4RG5SWmYxeklnVFVPSHYrY29HajlhZlh6ZDRV?=
 =?utf-8?B?S3JVMnZ0VHQ5SzlsS3F5VHM1SVh0N2pvc1BpajV3VVRaT3RzYVVQT1MxSGYx?=
 =?utf-8?B?Ny9SR0JXMVNZMHczeTV4YWVpM3U3NXZBdktIdmJWQXdHNjZKVyttclgvMWow?=
 =?utf-8?B?SVBmY1ZWZXp5dmVPN01YaFFJUWlYc21XTzdaS3VnVythMjcxVUxMMHhYNS8r?=
 =?utf-8?B?TzFTOEVsbWlnN3JYSWxEQXRpVEphN3JBQkQ3cUlTRktzTExPTEFOcDBPeUp0?=
 =?utf-8?B?aThzaUJrZWpWRUhNTUE5VXJNb3lZanNVRThmYUlxOENHaGRKc1lXZitvU05V?=
 =?utf-8?B?YzkwdndaeWZqUEp4SXN4SjRRcTExQWtvTEtGck45NjF5S0JXUGNLa042MU04?=
 =?utf-8?B?aXJhamR0emVoK25IUXRmTnhDVEZQVlJlaXZjQzdNeGRGYUVwYkQ3SVVUS3hM?=
 =?utf-8?B?Z3dVaDgveVhtL3JNY29mMzl3akJsU3pSMXlTY2l6blZTWFBsK3hJR0J0UEVk?=
 =?utf-8?B?Q0IxVENlcWFJY20rUklHd1M1WVFCaG9PQ3hRQnE1U3Fzc0pteFdGL3ZJTys5?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ViHisXx1K/iFMYzMSBa3k6RqN+URUHY2u2rSD0WpDzv+MfEVXDUASmoDFwfaHsMy+uov/uAstRTj3b2ABVFbtSgpIuXoN9M3vN7H3279LFVCOtS6YulCYnBVqK763JyShk7RIKdvttkiUb3HGNssI9cb7pgllk5hnrNAbBxgny5uJ31nv0nyI9QxBlGr/nzAvEhe8J9hdVqDm4kNgC+6Si6edRcfRkCLVZ8lR/F7lGer4uCcCt07TokBCbIZNh6ZgMeLRoZKCIAsZMWqdt2b5/9gcUUd4OvyVZB1rI64WyIEzuXwUPCycbyz15iCnxeSyr0uAE2Yd+ZyGWA7gMm1ANEnDahT0P5/tz5Z1ido6aO7sPA5aDVwtVtyxCvfBzHrR9O3atByNqgwo1//5HZ1gT3h/zL+8SlGvnDCjzX25lPC/BblISLsgsDhdgddhNgByuxNi0WFC6qIkI6Yc9LchoZm6BnyiwuDINYRe7Q2xC8Y9TaksdTmm7CbALdBG8g/0Y9U8eHuzKDtV8P1FODJenx5vwiwIsDZcLrM+LSFbMJiezt2ZeRreMMmojX2w/qUu6lv9OLY8tiZb9qlMMOVUoBnDnHraGX9ovFEgT4W9k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4c48b1-3d3f-4c43-4778-08dd30a172c7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 11:33:33.2475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjFibgg3LDQcs/LNHxfzxxkOxUwhkEedA4xvyg6kmgHu9yTM1yH3ZAbg0AhTNtVHIM/u5EGUFNbx0+t/wvYuzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6067
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_04,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090092
X-Proofpoint-ORIG-GUID: tVNKaNFSwXQFDtnXhoSVw7W7dJ6K8Uwe
X-Proofpoint-GUID: tVNKaNFSwXQFDtnXhoSVw7W7dJ6K8Uwe
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dLUYPjQLx7C.A.ULVE.me8fnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3324
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/fd048cd8-1c81-4346-8f8c-75c7dcd29008@oracle.com
Resent-Date: Thu,  9 Jan 2025 12:57:10 +0000 (UTC)

On 09/01/2025 05:57, Christoph Hellwig wrote:
> Add a helper that freezes the queue, updates the queue limits and
> unfreezes the queue and convert all open coded versions of that to the
> new helper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Ming Lei <ming.lei@redhat.com>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Apart from some nitpicking on the code comments, FWIW:
Reviewed-by: John Garry <john.g.garry@oracle.com>

> ---
>   block/blk-integrity.c      |  4 +---
>   block/blk-settings.c       | 24 ++++++++++++++++++++++++
>   block/blk-zoned.c          |  7 +------
>   drivers/block/virtio_blk.c |  4 +---
>   drivers/scsi/sd.c          | 17 +++++------------
>   drivers/scsi/sr.c          |  5 +----
>   include/linux/blkdev.h     |  2 ++
>   7 files changed, 35 insertions(+), 28 deletions(-)
> 
> diff --git a/block/blk-integrity.c b/block/blk-integrity.c
> index b180cac61a9d..013469faa5e7 100644
> --- a/block/blk-integrity.c
> +++ b/block/blk-integrity.c
> @@ -218,9 +218,7 @@ static ssize_t flag_store(struct device *dev, const char *page, size_t count,
>   	else
>   		lim.integrity.flags |= flag;
>   
> -	blk_mq_freeze_queue(q);
> -	err = queue_limits_commit_update(q, &lim);
> -	blk_mq_unfreeze_queue(q);
> +	err = queue_limits_commit_update_frozen(q, &lim);
>   	if (err)
>   		return err;
>   	return count;
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 89d8366fd43c..7c099d686dd8 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -444,6 +444,30 @@ int queue_limits_commit_update(struct request_queue *q,
>   }
>   EXPORT_SYMBOL_GPL(queue_limits_commit_update);
>   
> +/**
> + * queue_limits_commit_update_frozen - commit an atomic update of queue limits

nit: this has same brief description of queue_limits_commit_update(), 
but it does not do the same thing. I know that space is limited here for 
the comment, though.

> + * @q:		queue to update
> + * @lim:	limits to apply
> + *
> + * Apply the limits in @lim that were obtained from queue_limits_start_update()
> + * and updated by the caller to @q. 

"updated by the caller to @q" - this sounds odd

> Freezes the queue before the updated and
> + * unfreezes it after.

should that be "before the update"?

> + *
> + * Returns 0 if successful, else a negative error code.
> + */
> +int queue_limits_commit_update_frozen(struct request_queue *q,
> +		struct queue_limits *lim)
> +{
> +	int ret;
> +
> +	blk_mq_freeze_queue(q);
> +	ret = queue_limits_commit_update(q, lim);
> +	blk_mq_unfreeze_queue(q);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(queue_limits_commit_update_frozen);
> +

