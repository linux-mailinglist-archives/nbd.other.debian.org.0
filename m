Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FCD8D64D9
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 16:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5C0B420573; Fri, 31 May 2024 14:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 14:51:10 2024
Old-Return-Path: <zyjzyj2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,LDO_WHITELIST,RCVD_IN_DNSWL_NONE,TO_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C7B5020570
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 14:35:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.849 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lMIMcZFv0lsU for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 14:35:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C331820569
	for <nbd@other.debian.org>; Fri, 31 May 2024 14:35:27 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2e95a1f9c53so26919401fa.0
        for <nbd@other.debian.org>; Fri, 31 May 2024 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717166125; x=1717770925; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n05EtFe3sdj15ew6SLWTU1Vrct7rRtquCuzOf+gCyVM=;
        b=Yqz1H3oa8JqWfFda/VLcSTJxCh9+tP8SVijVxgJfjVwNmBR1uqCVNF2PEMa89/QCO4
         2rDGMh8bsGJNP6rbPDIj8G524D14WipnZorEsCfTxHLANbXF/ZO86jy67AIVPTJbb/t4
         nLDmILI2kOJYXR1JmJPS2YyotQe/Vw/GQ+bUhwPxJwj1H/GgXsE+DXt224CXnnMx1YMt
         hp0wcQi0pkNxqKDwxMJfDs5pUabm5KQa0YugS+U4MpjpushQHy7UAPFedctpOua4FsnD
         2SrOnuH/ZVpbFIlkk++hTRCFJlyxUTAi5bpLRq4XlfU+oYtu/vMC/o4F/nsF7AgOKubC
         U2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717166125; x=1717770925;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n05EtFe3sdj15ew6SLWTU1Vrct7rRtquCuzOf+gCyVM=;
        b=eVJHzZP//kqYWvjFkUgn3RMIuEyG0L9LGUdvP6rZl63gxUEoTdzt6bEXhw/A2oSfdF
         jzFU9Zv9vFLFhzJRlCgrjCa+olAjK9Uzvk6Hgviqsbx0ioGoOiKMFU2Fk6wjDtx1ITg8
         YX6pXVwdPnPFVh0hLSiUlgUfaNOhEoCFvgAkCyCltE3oLzyGFF0PNbVprT61f5ZS1wqD
         NLapcxfiLlQ8xqdCYw85LtWsa68cRt1VcdWnbQQAInijtd7w4l3XzWnD9grdt+ygeOc3
         5HrLBeSEungD2C70abwhBc3ysh1J32+SZ6kwHAV93AXLYeJoi00CimJCc0NtT3b2VMnU
         COGA==
X-Forwarded-Encrypted: i=1; AJvYcCXob4P0YiBSkQpVypHSfU48gH7k0Pm4woRA5cyCoI8gM7i6F+jWgV6eh5kTesz+9F0QJg85MO0ANvhO4f38DXbu6x9vcA==
X-Gm-Message-State: AOJu0Yxq919hWmdbVheWDT81LACHUT5HQvVHcjlU0J1sK71AT3abG268
	4dweKOGd1F1Dwh/U/smwBpAt1sfz/u8fC5L5wIDcRC7RDGJ3CEZp
X-Google-Smtp-Source: AGHT+IGVcCUHaZnpv1MwLaF6IIx1BsHReM37tDQicYsLW0v+utsuiS5MmlTY3NO6OJjjjtHmAt8QVg==
X-Received: by 2002:a05:651c:1402:b0:2ea:7def:46d0 with SMTP id 38308e7fff4ca-2ea950c896emr12043811fa.9.1717166124628;
        Fri, 31 May 2024 07:35:24 -0700 (PDT)
Received: from [10.16.155.254] ([212.227.34.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04da603sm1988134f8f.57.2024.05.31.07.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 07:35:24 -0700 (PDT)
From: Zhu Yanjun <zyjzyj2000@gmail.com>
X-Google-Original-From: Zhu Yanjun <yanjun.zhu@linux.dev>
Message-ID: <6cd21274-50b3-44c5-af48-179cbd08b1ba@linux.dev>
Date: Fri, 31 May 2024 16:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.10-rc1 kernel
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <wnucs5oboi4flje5yvtea7puvn6zzztcnlrfz3lpzlwgblrxgw@7wvqdzioejgl>
Content-Language: en-US
In-Reply-To: <wnucs5oboi4flje5yvtea7puvn6zzztcnlrfz3lpzlwgblrxgw@7wvqdzioejgl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Qrju6_Wp9UM.A.rp9O.ePeWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2882
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6cd21274-50b3-44c5-af48-179cbd08b1ba@linux.dev
Resent-Date: Fri, 31 May 2024 14:51:10 +0000 (UTC)

On 31.05.24 03:54, Shinichiro Kawasaki wrote:
> Hi all,
> 
> (I added linux-rdma list to the To list since blktests nvme and srp groups
>   depend on rdma drivers.)
> 
> I ran the latest blktests (git hash: 698f1a024cb4) with the v6.10-rc1 kernel,
> and observed a couple of failures as listed below.
> 
> There are two notable differences from the result with kernel v6.9-rc1 [1].
> The first one is srp/002,011 hangs with the rdma rxe driver, which was discussed

IIRC, the problem with srp/002, 011 also occurs with siw driver, do you 
make tests with siw driver to verify whether the problem with srp/002, 
011 is also fixed or not?

Thanks,
Zhu Yanjun

> at LSF 2024. I no longer observe these hangs with v6.10-rc1 kernel. Great :) I
> found Bob Pearson made a number of improvements in the driver. I guess these
> changes avoided the hangs. Thank you very much!
> 
> The other difference is nbd/002 failure. CKI project still reports it for
> v6.10-rc1 kernel [2]. Recently Josef provided blktests side fix [3] (Thanks!),
> and it has not yet applied to the CKI test run set up. The fix was made for
> nbd/001, but I expect that it will avoid the nbd/002 failure also.
> 
> [1] https://lore.kernel.org/linux-block/m6a437jvfwzq2jfytvvk62zpgu7e4bjvegr7x73pihhkp5me5c@sh6vs3s7w754/
> [2] https://datawarehouse.cki-project.org/kcidb/tests/12631448
> [3] https://lore.kernel.org/linux-block/9377610cbdc3568c172cd7c5d2e9d36da8dd2cf4.1716312272.git.josef@toxicpanda.com/
> 
> 
> List of failures
> ================
> #1: nvme/041 (fc transport)
> #2: nvme/050
> 
> Failure description
> ===================
> 
> #1: nvme/041 (fc transport)
> 
>     With the trtype=fc configuration, nvme/041 fails:
> 
>    nvme/041 (Create authenticated connections)                  [failed]
>        runtime  2.677s  ...  4.823s
>        --- tests/nvme/041.out      2023-11-29 12:57:17.206898664 +0900
>        +++ /home/shin/Blktests/blktests/results/nodev/nvme/041.out.bad     2024-03-19 14:50:56.399101323 +0900
>        @@ -2,5 +2,5 @@
>         Test unauthenticated connection (should fail)
>         disconnected 0 controller(s)
>         Test authenticated connection
>        -disconnected 1 controller(s)
>        +disconnected 0 controller(s)
>         Test complete
> 
>     nvme/044 had same failure symptom until the kernel v6.9. A solution was
>     suggested and discussed in Feb/2024 [4].
> 
>     [4] https://lore.kernel.org/linux-nvme/20240221132404.6311-1-dwagner@suse.de/
> 
> #2: nvme/050
> 
>     The test case fails occasionally with a QEMU NVME device. The failure cause
>     is the lockdep WARN among ctrl->namespaces_rwsem, dev->shutdown_lock and
>     workqueue work completion. After LSF 2024 discussion, Sagi and Keith worked
>     on the solution and Keith provided the fix [5]. Thank you!
> 
>     [5] https://lore.kernel.org/linux-nvme/20240524155345.243814-1-kbusch@meta.com/

