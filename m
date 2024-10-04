Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3EF98FC6F
	for <lists+nbd@lfdr.de>; Fri,  4 Oct 2024 05:00:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4FA6B2073B; Fri,  4 Oct 2024 03:00:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct  4 03:00:11 2024
Old-Return-Path: <yanjun.zhu@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2FA7B20738
	for <lists-other-nbd@bendel.debian.org>; Fri,  4 Oct 2024 02:43:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vczlPfcnU0aU for <lists-other-nbd@bendel.debian.org>;
	Fri,  4 Oct 2024 02:43:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linux. - helo: .out-186.mta1.migadu. - helo-domain: .migadu.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
X-Greylist: delayed 473 seconds by postgrey-1.36 at bendel; Fri, 04 Oct 2024 02:43:48 UTC
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [IPv6:2001:41d0:203:375::ba])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A13A820735
	for <nbd@other.debian.org>; Fri,  4 Oct 2024 02:43:48 +0000 (UTC)
Message-ID: <734623a7-c8c3-46f9-a564-c2265fb79ff1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728009352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymFwru73XfTHz1sVaFBcyx39mulsMFBjrH0H1o5NdvA=;
	b=iApDyG15i7FbLMDIaZ0ZF8bgQoeL5WtU9qypE2SWWluHBERlWAX1PAeLeixqM3x2/vlLXz
	JmdkYvjWUHZ52QioGrHtACKhxMKA09aiMLw/gFN8fLM7S39gAXE/20uuPsb7b7dBYnauqq
	p/ll/LjrmZPnOGg1ZkIWU4d3hlYja9k=
Date: Fri, 4 Oct 2024 10:35:33 +0800
MIME-Version: 1.0
Subject: Re: blktests failures with v6.12-rc1 kernel
To: Bart Van Assche <bvanassche@acm.org>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <xpe6bea7rakpyoyfvspvin2dsozjmjtjktpph7rep3h25tv7fb@ooz4cu5z6bq6>
 <e6e6f77b-f5c6-4b1e-8ab2-b492755857f0@acm.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <e6e6f77b-f5c6-4b1e-8ab2-b492755857f0@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <c4Lj-YNXMlD.A.tR3I.7o1_mB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3153
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/734623a7-c8c3-46f9-a564-c2265fb79ff1@linux.dev
Resent-Date: Fri,  4 Oct 2024 03:00:11 +0000 (UTC)

在 2024/10/4 4:56, Bart Van Assche 写道:
> On 10/3/24 1:02 AM, Shinichiro Kawasaki wrote:
>> #3: srp/001,002,011,012,013,014,016
>>
>>     The seven test cases in srp test group failed due to the WARN
>>     "kmem_cache of name 'srpt-rsp-buf' already exists" [4]. The 
>> failures are
>>     recreated in stable manner. They need further debug effort.
> 
> Does the patch below help?

Hi, Bart

What is the root cause of this problem?

The following patch just allocates a new memory with a unique name. Can 
we make sure that the allocated memory is freed?

Does this will cause memory leak?

Thanks,
Zhu Yanjun

> 
> Thanks,
> 
> Bart.
> 
> 
> Subject: [PATCH] RDMA/srpt: Make kmem cache names unique
> 
> Make sure that the "srpt-rsp-buf" cache names are unique. An example of
> a unique name generated by this patch:
> 
> srpt-rsp-buf-fe80:0000:0000:0000:5054:00ff:fe5e:4708-enp1s0_siw-1
> 
> Reported-by: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Fixes: 5dabcd0456d7 ("RDMA/srpt: Add support for immediate data")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   drivers/infiniband/ulp/srpt/ib_srpt.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ 
> ulp/srpt/ib_srpt.c
> index 9632afbd727b..c4feb39b3106 100644
> --- a/drivers/infiniband/ulp/srpt/ib_srpt.c
> +++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
> @@ -2164,6 +2164,7 @@ static int srpt_cm_req_recv(struct srpt_device 
> *const sdev,
>       u32 it_iu_len;
>       int i, tag_num, tag_size, ret;
>       struct srpt_tpg *stpg;
> +    char *cache_name;
> 
>       WARN_ON_ONCE(irqs_disabled());
> 
> @@ -2245,8 +2246,13 @@ static int srpt_cm_req_recv(struct srpt_device 
> *const sdev,
>       INIT_LIST_HEAD(&ch->cmd_wait_list);
>       ch->max_rsp_size = ch->sport->port_attrib.srp_max_rsp_size;
> 
> -    ch->rsp_buf_cache = kmem_cache_create("srpt-rsp-buf", ch- 
>  >max_rsp_size,
> +    cache_name = kasprintf(GFP_KERNEL, "srpt-rsp-buf-%s-%s-%d", src_addr,
> +                   dev_name(&sport->sdev->device->dev), port_num);
> +    if (!cache_name)
> +        goto free_ch;
> +    ch->rsp_buf_cache = kmem_cache_create(cache_name, ch->max_rsp_size,
>                             512, 0, NULL);
> +    kfree(cache_name);
>       if (!ch->rsp_buf_cache)
>           goto free_ch;
> 
> 

