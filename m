Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADDD6EC9E2
	for <lists+nbd@lfdr.de>; Mon, 24 Apr 2023 12:12:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3A5FB206E5; Mon, 24 Apr 2023 10:12:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 24 10:12:16 2023
Old-Return-Path: <nj.shetty@samsung.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0F5042069F
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Apr 2023 09:56:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.501 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eTuA0PKumkU0 for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Apr 2023 09:56:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 413 seconds by postgrey-1.36 at bendel; Mon, 24 Apr 2023 09:56:23 UTC
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mailout4.samsung.com", Issuer "DigiCert TLS RSA SHA256 2020 CA1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0D12D20677
	for <nbd@other.debian.org>; Mon, 24 Apr 2023 09:56:21 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20230424094922epoutp0426501b9f312a63af8f56004814ac8bcb~Y1gFacvSD0650106501epoutp041
	for <nbd@other.debian.org>; Mon, 24 Apr 2023 09:49:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20230424094922epoutp0426501b9f312a63af8f56004814ac8bcb~Y1gFacvSD0650106501epoutp041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1682329762;
	bh=31RWr4izbPdOzAjp5njGY46la8LA9hZVsJhRUiuap1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=knWrGkKDgVyfX2HdOQAUVW+EcuDk6gTCHb6pj25SxR4gcWVbESQJWrMY4kbp3UdaP
	 2jyTwIFRIiXRkIxKdj5EVKhCzLNax1zbEdm4GZb/PyEGgSTOBZDoFqs9kBnUTMh0Qg
	 BIgSKogYte2CfFr96cwN3uq3QCBTR0agf3lktDsg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20230424094921epcas5p226e6574fce697200e5b529220d615123~Y1gE7W_b42348523485epcas5p2U;
	Mon, 24 Apr 2023 09:49:21 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Q4gMM6cvHz4x9Pp; Mon, 24 Apr
	2023 09:49:19 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F5.38.54880.F9056446; Mon, 24 Apr 2023 18:49:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20230424092940epcas5p3407002e7d5c79593ffbafc38f2b49e51~Y1O4ma3pU2242622426epcas5p3H;
	Mon, 24 Apr 2023 09:29:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230424092940epsmtrp10d8a2619094be279d56ab0a06e1ffd23~Y1O4k3zOG1327913279epsmtrp1X;
	Mon, 24 Apr 2023 09:29:40 +0000 (GMT)
X-AuditID: b6c32a49-8c5ff7000001d660-a7-6446509febca
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9F.41.27706.30C46446; Mon, 24 Apr 2023 18:29:39 +0900 (KST)
Received: from green245 (unknown [107.99.41.245]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20230424092937epsmtip1f2178ee6e7ac23f48d0d223ba1f56cf6~Y1O2MU2HJ0425804258epsmtip1T;
	Mon, 24 Apr 2023 09:29:37 +0000 (GMT)
Date: Mon, 24 Apr 2023 14:56:41 +0530
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	axboe@kernel.dk, josef@toxicpanda.com, minchan@kernel.org,
	senozhatsky@chromium.org, colyli@suse.de, kent.overstreet@gmail.com,
	dlemoal@kernel.org, johannes.thumshirn@wdc.com, bvanassche@acm.org,
	vincent.fu@samsung.com, akinobu.mita@gmail.com, shinichiro.kawasaki@wdc.com,
	nbd@other.debian.org, Jason@zx2c4.com
Subject: Re: [PATCH 0/5] block/drivers: don't clear the flag that is not set
Message-ID: <20230424092641.u6u25eyojewvasj4@green245>
MIME-Version: 1.0
In-Reply-To: <20230424073023.38935-1-kch@nvidia.com>
User-Agent: NeoMutt/20171215
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBJsWRmVeSWpSXmKPExsWy7bCmhu78ALcUg1/njCxeHehgtFh9t5/N
	YtqHn8wW0xvPs1s82G9v8eCqlMXfrntMFn8eGlo8vTqLyeJIU5XFsW3XmCz23tK2WPb1PbvF
	76drmSx2b1zEZrFvlqfF4+4ORgdBj8tXvD1mN1xk8dg56y67x+WzpR6bVnWyefQ2v2PzuPqt
	mdmjb8sqRo/Np6s9JmzeyOrxeZOcR/uBbiaPyX+fMgfwRmXbZKQmpqQWKaTmJeenZOal2yp5
	B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gD9paRQlphTChQKSCwuVtK3synKLy1JVcjI
	Ly6xVUotSMkpMCnQK07MLS7NS9fLSy2xMjQwMDIFKkzIzjiz9ANjQQdrxaUn2Q2MK1i6GDk4
	JARMJLa9Tu9i5OIQEtjNKNFzch0ThPOJUeLm3eOsXYycQM43RonOz/ogNkjDt4vdzBDxvYwS
	zy+oQtjPGCX+XvAGsVkEVCXWL77EDrKATUBb4vR/DpCwiIC6xNQDPawg85kF/jNJdPRtYARJ
	CAv4SJxr+8QOYvMKmEn827CLEcIWlDg58wkLiM0JtHfx8ilgNaICMhIzln5lBhkkIfCFQ+Lc
	uzksEMe5SBya0Q1lC0u8Or6FHcKWknjZ3wZll0usnLKCDaK5hVFi1vVZjBAJe4nWU/1gnzEL
	ZEhM2DsdapCsxNRToGABifNJ9P5+wgQR55XYMQ/GVpZYs34BG4QtKXHteyMbJHg9JOZfloYE
	UDujxPsT/hMY5Wch+W0Wkm0QtpVE54cm1llA3cwC0hLL/3FAmJoS63fpL2BkXcUomVpQnJue
	WmxaYJiXWg6P7OT83E2M4CSv5bmD8e6DD3qHGJk4GA8xSnAwK4nwepQ6pQjxpiRWVqUW5ccX
	leakFh9iNAXG1URmKdHkfGCeySuJNzSxNDAxMzMzsTQ2M1QS51W3PZksJJCeWJKanZpakFoE
	08fEwSnVwMS4SkK+/0joLaemjtC+3u/3DDPuHzn1qa555Qb9/L+T39ROZ9k5/ah/mYeXwvOw
	60+3dm+7xGC26s6xprDOv0Epu+Z3KJdtDJwctHZqruuiI8db77dIRd9ONF/mNv37ebG8hASp
	24qGD5vzQx96nlSp1BeN9Sg/fyT8R2t+44GIQsObLjomG7T/vFddsvraAr9XAgu41xbpq0yf
	NCPJaN+BD9JsESv82opWBEjwfKk0uuMuai/orKr55c5hRYZ3cpM1etTEVZtbp5udFjJS/lyr
	ZHBn3f/WSRo3RSbN1zGvyDaP/LR4+dYv2yu/LCtd0acSqR5Ueex8XEOqwgSRHs1zB65z657Z
	8W7RsoJ5z5VYijMSDbWYi4oTAVgfIwR7BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsWy7bCSnC6zj1uKwdWrNhavDnQwWqy+289m
	Me3DT2aL6Y3n2S0e7Le3eHBVyuJv1z0miz8PDS2eXp3FZHGkqcri2LZrTBZ7b2lbLPv6nt3i
	99O1TBa7Ny5is9g3y9PicXcHo4Ogx+Ur3h6zGy6yeOycdZfd4/LZUo9NqzrZPHqb37F5XP3W
	zOzRt2UVo8fm09UeEzZvZPX4vEnOo/1AN5PH5L9PmQN4o7hsUlJzMstSi/TtErgyjt3YzFKw
	i6ni0dTF7A2MXxi7GDk5JARMJL5d7GbuYuTiEBLYzShxd+YKqISkxLK/R5ghbGGJlf+es0MU
	PWGUWLX0IgtIgkVAVWL94ktACQ4ONgFtidP/OUDCIgLqElMP9LCC1DML/GeS2NXWCDZIWMBH
	4lzbJ3YQm1fATOLfhl1gy4QEjCWenVvFChEXlDg58wnYfGagmnmbHzKDzGcWkJZY/g9sPifQ
	0YuXTwEbIyogIzFj6VfmCYyCs5B0z0LSPQuhewEj8ypGydSC4tz03GLDAsO81HK94sTc4tK8
	dL3k/NxNjOAo1dLcwbh91Qe9Q4xMHIyHGCU4mJVEeD1KnVKEeFMSK6tSi/Lji0pzUosPMUpz
	sCiJ817oOhkvJJCeWJKanZpakFoEk2Xi4JRqYBJx3HiibFLrPZ4DGpwzFylMVnRKSxZYYzyt
	7hL793uyj0/PEj1/uTXqRu3SzUV+mec0ZhgEJu0wjYmqs79d4F3eUrw9a2vzq8D1aZNv6B0w
	ujznw48pL77MfL2l/3NA+3H1U5x7pl5uX3xnwck/Zq5LNrxQXcCWNeXBzFSnxLKGQx1lljvu
	LwmfNOm4rZTb6qzfjlNnPu07HN4f35caM91M5fXjhjRjo/Xhj5mKbe+4KKicvZjsVK93757Z
	luV3JG5zlD43qEzJPtP/7JTjE4GGc4+bFp2yKN7JKHA1076ogZM5SqJjyemZR2uao5Q+hzEZ
	7GwIMzl48LpH9D3tmZPkP8semz7tpoPja99fLySVWIozEg21mIuKEwFY4cnVQQMAAA==
X-CMS-MailID: 20230424092940epcas5p3407002e7d5c79593ffbafc38f2b49e51
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----6TPaBgSVJHTP5aYW_KCyJfD-AyyqAIDIArT8HI0pnVcs47o3=_3f117_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230424092940epcas5p3407002e7d5c79593ffbafc38f2b49e51
References: <20230424073023.38935-1-kch@nvidia.com>
	<CGME20230424092940epcas5p3407002e7d5c79593ffbafc38f2b49e51@epcas5p3.samsung.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KCKtr--rS0.A.UfE.AYlRkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2446
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230424092641.u6u25eyojewvasj4@green245
Resent-Date: Mon, 24 Apr 2023 10:12:16 +0000 (UTC)

------6TPaBgSVJHTP5aYW_KCyJfD-AyyqAIDIArT8HI0pnVcs47o3=_3f117_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On 23/04/24 12:30AM, Chaitanya Kulkarni wrote:
>null_blk
>brd
>nbd
>zram
>bcache

Any particular reason for leaving out mtip and s390 drivers ?

Will it be better to use the flag similar to scsi devices and
use it for random number generation ?

Otherwise looks good to me.

Regards,
Nitesh Shetty

------6TPaBgSVJHTP5aYW_KCyJfD-AyyqAIDIArT8HI0pnVcs47o3=_3f117_
Content-Type: text/plain; charset="utf-8"


------6TPaBgSVJHTP5aYW_KCyJfD-AyyqAIDIArT8HI0pnVcs47o3=_3f117_--

