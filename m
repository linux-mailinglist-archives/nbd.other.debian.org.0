Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 16313505F7E
	for <lists+nbd@lfdr.de>; Mon, 18 Apr 2022 23:54:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ED6E6203BB; Mon, 18 Apr 2022 21:54:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 18 21:54:09 2022
Old-Return-Path: <chaitanyak@nvidia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,THREADTOPIC,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7428620350
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Apr 2022 21:38:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.526 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.282,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, THREADTOPIC=2,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id T4jzdotd3Hsh for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Apr 2022 21:38:05 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .nvidia. - helo: .nam12-bn8-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 894 seconds by postgrey-1.36 at bendel; Mon, 18 Apr 2022 21:38:05 UTC
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9CA002031B
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 21:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ahltv4baQgP64rZir2XmZjBKOiurntvq0NHiJGnyOiVp/Mih+c/7k9R/sOM7dVzJLL+ydo4sCfhW9EtD6QD4AWUebh355mz/JMDv8SKWWaXEFwz/5fZkGFtVseUMjyfB66NsnYQDFMlONPuA5twN1kE1qgb7VdGAiZk928q9vEGnCuyRDda62UhJduuhL5i64q3gnwJSvLyZG3pwQRtf0yi35qmffvSH/w1aD1nU5C3nCv8bV+8zaWK2eLilrtnER5Ang6YQDtjgFiPS9TxiExtLITGIcjlrEDDV4YzeU94egJ2IG6Nj6rTaQ96pShsBrBzHOGf+5AC63Q/rad08jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHAtozakIa+rugaZJkDU64nrzSb8M+UK1EwDJHNwVhQ=;
 b=QLLkL5Ftm+W1VR/afboZaZBgiD6BsYT9Kl6++CYVzWq7c6FSSHLV2b1+ClMEOocv0PNLuqUCTMjj9aWB3Ftu2wBL6S6v9WmSwL2SU9kfxChyejoVXP49prZ+2s9gBs/FuB67U8e9K7ZHyZHQt0WP5OOiSUy3m4yXe6tV+Kn41irBAtqs7OnCepuZtUZKV+e5wUUMwO3nX535roLB31fUUwIEW/GXQixrZkxll6mDd5/LhRqgoZeKnG3rKAEIz7bDpD9rTq2Top909NpUIjY2pjA0nL1iNE17aHKlUb7FAhrRTYNf/qW7BOCd51WXrDCG+23xrKBmz0i7kbG41BKk1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHAtozakIa+rugaZJkDU64nrzSb8M+UK1EwDJHNwVhQ=;
 b=i9E5C5fkyINkyhujSvZmmJrJXug111LbwYGi1FiuNlLfxmJpmceV2xJXfqLvNWhxb/53WAQ3LkiSPlZxSDy/o60pbUfaKW6zRA1Iw7vS6RcT5WIfgk2LpYUDjxoJ6oogKu6QLyjOuVZu8rDLREBWSyew8qwDp8JXcFQrNEyIiD9YN61zznIpwcdeJGwQIGCPhOSnEvNSFXErRO/BbsnQF10AQem3KMI5Vn5ks9Xmk317Gli7KVxlQJh9j682Cr/Nx7CZyu/ETGDvtPFy9tsWDn34bpWj3Z1UKeqflamo2PU+3Olt9GDd/gkk3lAHcHBLT7Ph93F7Pnumjw3FTJ3MtQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by DM4PR12MB5101.namprd12.prod.outlook.com (2603:10b6:5:390::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 21:22:25 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 21:22:25 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Richard Weinberger <richard@nod.at>, Johannes Berg
	<johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, "Md. Haris
 Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Mike Snitzer
	<snitzer@kernel.org>, Song Liu <song@kernel.org>, Stefan Haberland
	<sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-raid@vger.kernel.org"
	<linux-raid@vger.kernel.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [PATCH 03/11] null_blk: don't set the discard_alignment queue
 limit
Thread-Topic: [PATCH 03/11] null_blk: don't set the discard_alignment queue
 limit
Thread-Index: AQHYUuBbOHZrkZG1wkiLxi5X413wpaz2LwoA
Date: Mon, 18 Apr 2022 21:22:25 +0000
Message-ID: <89b62032-297a-1201-3a35-fa1731a0d620@nvidia.com>
References: <20220418045314.360785-1-hch@lst.de>
 <20220418045314.360785-4-hch@lst.de>
In-Reply-To: <20220418045314.360785-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9cd3ac9-a34b-453e-372e-08da218188bd
x-ms-traffictypediagnostic: DM4PR12MB5101:EE_
x-microsoft-antispam-prvs:
 <DM4PR12MB5101D98C45971BA44D603479A3F39@DM4PR12MB5101.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aRpHrH2zfUblOq5eGVmc/JRpRc6KZNhp5dR+XBuco/SHMe93F0bxC2UTJLLOm2T+6EdQ+c4XeV+ul0kQHLz2Vnn1y0V5QEmI103RjJRobjFKKxPfVxaWndfqq6qT3iYhthYrZJT6dIoYhHGYfKyqTlfDZrIGK0R6BiRt4g5uiCf2x0bcl2DWontr5Dr61AmhQloenQKAgsEU5INA/q4qu+9FjAJLos21upgt82THgXyhKD8QSrW8opFfz/Y1+NDrDPaEgRSxXF8RK4/StZnJg1Fom3RNUryA3xXkr+shyyzD+Fv5nl+YITFaersVxhpvxjG6QmQH1kgno3SL9vK0+uHcaaPdOVm4DI/DE8Zm2jPe16n8zhEHPVmzdxmyNaE4rT/U6r4ZlrOrOYEEGiUCQHROMX4m8wMp+sN0nfUCAgOTkNWFxbp/jrUNrL1NrOF3BjOyA7c5ZcaFN0F9cnQ7Eu6PMJDEmRB/sCpGgSEFtFaQap9vAzzBpgIaluqI7qffiUoiiBFV4QO2yqqdGlUl6eoefFlGZTwEqBeWJq887fm0UXYYU3MotTAl+4zbvEZ1wtXpfNM3KX3QcoeuaWGC6zN3GxRx6UYqfCjjdkW9fAgDbBMsse15a+S1BG6yE7SJEiDs0xP7T4Li5r0GN9gD/KajsmHdSpTiCzxmISh6t4H1eQOT0+h8IYRRwH2wYFOACxRDoNc/TXQAXy6iL5I0WnGIFQL8hiNjNez18GCbfLQn1KNFYZ6WzKUvEj1kncFHCTcolnhLCH87Zl2bO/+DTA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB4667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(122000001)(4744005)(38100700002)(5660300002)(4326008)(6486002)(83380400001)(186003)(2616005)(54906003)(110136005)(508600001)(6512007)(71200400001)(6506007)(7416002)(66556008)(66476007)(64756008)(8676002)(76116006)(8936002)(66446008)(53546011)(66946007)(316002)(91956017)(31686004)(86362001)(2906002)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHlwcE9FdWtqUDhXN2M1c1lUQ2NEbk52YnlWd1drazN0OXo0NXZMQkhTTjRU?=
 =?utf-8?B?UVp5WDlnN01SYk5VSFlhdmlBRHFLdjNzTnN1ajhINUdsM2RNYkhtZnhqcTdv?=
 =?utf-8?B?TlVQSmtTRGFWd3FWNVpqNERvSnVEUTFvUGloWWRpKzNCbm5KWHJobXVPMzNH?=
 =?utf-8?B?a0kvKyt3cmpJWVF2QVo2Y3dwOUJjNVlRTm50UTVzM010eXdjM01MQWpZVWg3?=
 =?utf-8?B?QUR0c2ZHSFh6N1QrRkU4SHJlMzVBYW1jcGpvdkY0RS9ady9YTFZsUVZDSjBr?=
 =?utf-8?B?VWdLSEtkdGRlbWFreGVSaWNkak1ZU2ZFNFJ5ZjNBN3hDdmpaeGNydUFZdlFZ?=
 =?utf-8?B?eG9JOVRyVlRheG1jNklhZlgwRGEvanBmV2p5MVRncGNZWnhUQ3hNZEVuaEFI?=
 =?utf-8?B?L2VUMzR2TTVwSUJROUpkd2l1blVDelhXcWhudmZRV1d4S05LTGZLOFg0cVhF?=
 =?utf-8?B?RkFiOVU1K0c1eVd5bXZnbGxraE5GM1dMYzdaZTdjbnA3STZPOHYyMTc5MHY2?=
 =?utf-8?B?SVZRdEpRSVNPTjJGc3dqQnhYS25hdTdNMU1wOFlaVmxoNkFrbkJ6ams0c1Zi?=
 =?utf-8?B?VlJqVEI0TlBiTTU4ckhDWVk1RnRhSGJEazRZdFg0THI3d3Z2dkx1bS9rQ2Zo?=
 =?utf-8?B?TzR6Q0g5QWF4VjVFcVZ0ZDdUQjJVMU5ySTdqN1M2UFdvakZhdlZ4enpaRTRK?=
 =?utf-8?B?NHhjVGRNbHA5WW5Yd0x6NkVXTjZoYVV1NGFxY1F4VmlaKzNpL3dJZmsycVhl?=
 =?utf-8?B?NVJ4MHBHczBvMWZNYzFmcmswVUVWSEl3S0N2dkVKVVpwelpFSytzQUU1bVJ4?=
 =?utf-8?B?QmUyTHgvYUtCTWphMnAxSjVlcDcwcENFcGgxQjBPbEVwTkRLZHF1K1hOM2hK?=
 =?utf-8?B?Q1o5cWdsNGRSQ3RvdXZQR3JOcVZLNFNVWk92NlQyNkdPOVFhM1c3L3Viek02?=
 =?utf-8?B?ZGJYRkUzNzd4MVU2WlVxUEtLSXJHSWlOYlcwRjBoSTFzbnZSMFlVWm1yL1FW?=
 =?utf-8?B?ZzI1bEs0MEgydFhtNXBtMHR1aEpFK1dwRHMrRitiUmJYOU8weU04MytDamth?=
 =?utf-8?B?ZFBGNkNrOGhUd0xYMGU5cktxZjI2RWw4Vll4ZEZxSDQxMVFsT1hyZm9EUFJy?=
 =?utf-8?B?NTVCYVF4YkpTdVZDS002UVo0Wk9qQW1EWldBTlZGb1hCV3JrM1ZkU2tkTlIz?=
 =?utf-8?B?Y3k5UmQxMHd0WWFCR0d0b3FVdnlmQUhYUUlXYml5dmJ3NElpVmtZRFhFMkFJ?=
 =?utf-8?B?ekwwR0ZnY3VVazZHZzFBS0hua3RqVkU2Y3J4WnRhc0tWK2t0cE82c3hxWUpG?=
 =?utf-8?B?YkNBUS9vZUg3aFF6R1hiQ2p5ckZTN05EUzFUTXRRamJ3amZHNHFLQ0x2WFoz?=
 =?utf-8?B?SDFuNWkxMzJNK1dVNDNRWHpyM1lZNzJkekwvdVVXRFpiUUsrTmc5ZTcvQUdv?=
 =?utf-8?B?OWZLYkJacWgxbWNCQ3hVbklzTEQxRjNBVWh4TGdjNStxOGdTYUIrdjhvS3Jp?=
 =?utf-8?B?dE5YakJtRVRVQTI3VjF2dUM5RU14eWVpQ3BBdjY5dUovVityNzJzUVBacm1D?=
 =?utf-8?B?VGcyMGhpKzhCd1hwQ3Q5Q2xWSDlNaXZvcFBDL1hlRDhEbjlvdUVNS0phaHpy?=
 =?utf-8?B?ZWNpcjZJTytQTG5yMXFGUCtXYk1MWWNuai8rQVRvTzRvYUkvK0tMRGZVdXN6?=
 =?utf-8?B?WXZJcEk5UHJlNHZyVE1vZzdsS1ZTaGlkRkdqdkc1VzhzTXQ2TzJ1SEY2UjZo?=
 =?utf-8?B?ZmJlTlNSdC8rb3pBVmxmNFNGRWQ4b0NBd3BQZ21EeWFOUnZRUmttdkhic2RU?=
 =?utf-8?B?MlhLYm5WVnZWcU1URlZZZmNCMWZYencvbHJZZGJHNmdLNm1qc0lJdXM5dEcv?=
 =?utf-8?B?dXI4Z1VyM2llU1J0dEhtcFc3SE16NjlxbmxNU2RxZlE3WGNYZGNEOGREM3Mw?=
 =?utf-8?B?elRKL2JmNkNsa0pLNGNySzcwSUlFQ1RTcDh1WStUL0d5MjFzdTNZOUFGTTJN?=
 =?utf-8?B?eDN6RjlnMWd2VnpEdkhLL1dOVkVSZGNWVlNUaEpWOHBpZVBWVjF1ZHVqbjlF?=
 =?utf-8?B?azNRWU9La1VOdXF4SGpVM0ZUVTZvc2p0TFJSK3N3Q2hrRzU0NlVSNmZuYWZM?=
 =?utf-8?B?cnFldThZQkJlU3VaS0lrVE1TbHVoNTlkQks0OXRRWXhKdERMOWh3dTZnSGhZ?=
 =?utf-8?B?QTdPRVRTZExTRGlQU0ZsZnJrcy9naXRJa0RabEwyS05aSU9vc0wwN1MwYnRM?=
 =?utf-8?B?QkxLTzZqdkF2YUxwMlREbHhUQ25PTU81T1hObWwyZ1RnRm9YVUNjMzlzUzIv?=
 =?utf-8?B?WnBqdDMwT25mbXdjdWZQUFZMR05ySUJCUmxsdGM3NHdDbStyWFpGd3BlTWhR?=
 =?utf-8?Q?UaiVDBgSRkbWIBTE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED7EE68D9ECC2E45BB1E6AA4E02C1AC7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cd3ac9-a34b-453e-372e-08da218188bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 21:22:25.3852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ocsZWn2s6zKRxvQpyKeFcrsqFtOLj2JpUOEoP9+wJ9xZDYN6R4YaqeL0mZLa1xxmZ3QSO9WGmlE7qcBux2cerA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5101
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2v473hnlbFH.A.hYB.B4dXiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2038
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/89b62032-297a-1201-3a35-fa1731a0d620@nvidia.com
Resent-Date: Mon, 18 Apr 2022 21:54:09 +0000 (UTC)

T24gNC8xNy8yMiAyMTo1MywgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IFRoZSBkaXNjYXJk
X2FsaWdubWVudCBxdWV1ZSBsaW1pdCBpcyBuYW1lZCBhIGJpdCBtaXNsZWFkaW5nIG1lYW5zIHRo
ZQ0KPiBvZmZzZXQgaW50byB0aGUgYmxvY2sgZGV2aWNlIGF0IHdoaWNoIHRoZSBkaXNjYXJkIGdy
YW51bGFyaXR5IHN0YXJ0cy4NCj4gU2V0dGluZyBpdCB0byB0aGUgZGlzY2FyZCBncmFudWxhcml0
eSBhcyBkb25lIGJ5IG51bGxfYmxrIGlzIG1vc3RseQ0KPiBoYXJtbGVzcyBidXQgYWxzbyB1c2Vs
ZXNzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
DQo+IC0tLQ0KDQpSZXZpZXdlZC1ieTogQ2hhaXRhbnlhIEt1bGthcm5pIDxrY2hAbnZpZGlhLmNv
bT4NCg0KLWNrDQoNCg0KDQo=

