Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B198F8E0
	for <lists+nbd@lfdr.de>; Thu,  3 Oct 2024 23:24:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A33962071D; Thu,  3 Oct 2024 21:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct  3 21:24:09 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_LOW,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4B1772071D
	for <lists-other-nbd@bendel.debian.org>; Thu,  3 Oct 2024 21:06:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.8 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7, TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 93dV6Y9Q1A-n for <lists-other-nbd@bendel.debian.org>;
	Thu,  3 Oct 2024 21:06:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
X-Greylist: delayed 608 seconds by postgrey-1.36 at bendel; Thu, 03 Oct 2024 21:06:49 UTC
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R10" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4D26A20454
	for <nbd@other.debian.org>; Thu,  3 Oct 2024 21:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XKP9d3r9lzlgVnY;
	Thu,  3 Oct 2024 20:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1727988995; x=1730580996; bh=FTm9+Fd9U/H4haC16sHTR1bT
	ESO2Tnj8MtorXX9dHs8=; b=xk/+/6N6QppPaTwrc2/ZXsj7P0XkCx6/abEpvUij
	7rnzdtFkmXCvnGQ4WT4/ROVVqQIWjE1GhpClMCwptIEXn9w3ODdu2lepfN1d555H
	yXw15gb0ui1kT/tG1PKxhSX09JjcUVSPhdD0JVgteokPrfxlxKnJtAxSdnjVWXP2
	xJNDOpzJOoxivlrpxMLynthyTW/4UykYwKxUyTxnvelDN2Oqtwh/cFGCGxGEi1GG
	VLg50OPsv6B1vbWzD0Sdz6VDL1iTfbimrklp8ua2U2UDeIKdhXGUGHBmPgudS9Dk
	3sQevp889vWwxaYwUCvuG+kD/tb5ChPjxaP81gsLcc2foQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id xiJGC-xD0fY5; Thu,  3 Oct 2024 20:56:35 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4XKP9Y5388zlgVnN;
	Thu,  3 Oct 2024 20:56:33 +0000 (UTC)
Message-ID: <e6e6f77b-f5c6-4b1e-8ab2-b492755857f0@acm.org>
Date: Thu, 3 Oct 2024 13:56:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.12-rc1 kernel
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <xpe6bea7rakpyoyfvspvin2dsozjmjtjktpph7rep3h25tv7fb@ooz4cu5z6bq6>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <xpe6bea7rakpyoyfvspvin2dsozjmjtjktpph7rep3h25tv7fb@ooz4cu5z6bq6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5Dlf7ZuyX6G.A.Dq9D.5tw_mB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3152
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e6e6f77b-f5c6-4b1e-8ab2-b492755857f0@acm.org
Resent-Date: Thu,  3 Oct 2024 21:24:09 +0000 (UTC)

On 10/3/24 1:02 AM, Shinichiro Kawasaki wrote:
> #3: srp/001,002,011,012,013,014,016
> 
>     The seven test cases in srp test group failed due to the WARN
>     "kmem_cache of name 'srpt-rsp-buf' already exists" [4]. The failures are
>     recreated in stable manner. They need further debug effort.

Does the patch below help?

Thanks,

Bart.


Subject: [PATCH] RDMA/srpt: Make kmem cache names unique

Make sure that the "srpt-rsp-buf" cache names are unique. An example of
a unique name generated by this patch:

srpt-rsp-buf-fe80:0000:0000:0000:5054:00ff:fe5e:4708-enp1s0_siw-1

Reported-by: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Fixes: 5dabcd0456d7 ("RDMA/srpt: Add support for immediate data")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
  drivers/infiniband/ulp/srpt/ib_srpt.c | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c 
b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 9632afbd727b..c4feb39b3106 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -2164,6 +2164,7 @@ static int srpt_cm_req_recv(struct srpt_device 
*const sdev,
  	u32 it_iu_len;
  	int i, tag_num, tag_size, ret;
  	struct srpt_tpg *stpg;
+	char *cache_name;

  	WARN_ON_ONCE(irqs_disabled());

@@ -2245,8 +2246,13 @@ static int srpt_cm_req_recv(struct srpt_device 
*const sdev,
  	INIT_LIST_HEAD(&ch->cmd_wait_list);
  	ch->max_rsp_size = ch->sport->port_attrib.srp_max_rsp_size;

-	ch->rsp_buf_cache = kmem_cache_create("srpt-rsp-buf", ch->max_rsp_size,
+	cache_name = kasprintf(GFP_KERNEL, "srpt-rsp-buf-%s-%s-%d", src_addr,
+			       dev_name(&sport->sdev->device->dev), port_num);
+	if (!cache_name)
+		goto free_ch;
+	ch->rsp_buf_cache = kmem_cache_create(cache_name, ch->max_rsp_size,
  					      512, 0, NULL);
+	kfree(cache_name);
  	if (!ch->rsp_buf_cache)
  		goto free_ch;


