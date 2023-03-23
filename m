Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDC56C73DF
	for <lists+nbd@lfdr.de>; Fri, 24 Mar 2023 00:09:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9C281206BA; Thu, 23 Mar 2023 23:09:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 23 23:09:14 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	GMAIL,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 335EE20537
	for <lists-other-nbd@bendel.debian.org>; Thu, 23 Mar 2023 22:51:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	GMAIL=1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qXlzRzPSip0Y for <lists-other-nbd@bendel.debian.org>;
	Thu, 23 Mar 2023 22:51:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x1031.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BBC0420682
	for <nbd@other.debian.org>; Thu, 23 Mar 2023 22:51:23 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so3394181pjb.4
        for <nbd@other.debian.org>; Thu, 23 Mar 2023 15:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679611880; x=1682203880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E0OX40ehjV5gIkQr/Q9nraxMiJdzGjqFLifP7n6ggXk=;
        b=TTqPzThDGMupB/gagrp+rTbV3eHSKSSrLjeATpLujyP3BjQhyLVdJPW0nFqfh7lx4X
         /tL5/prrRpFJnHz7NO9yWbSZYuEIbhgoUu+hIfGI0YCk0HO1n6FyPw4xLxD9b87pvVSL
         CK4W5AVwxkz0p8kq6QRhUEa31VKANW6YLLR5YwZwnuwvYDUbDeFzkaD1tIbclly1k12L
         ahS0F94a0rnpiFBIxQyHIiS7ylZ5k+o/htcVsn/9Ucp/a9U4M5NJTvX5L1BCfVR3S3RX
         8wl5iIN2tmHyYrx+Vw8BnXwd2RfKOSW3OFEYaEwQz3LNenf0o4ch+tpXJBuJgtXi4Taf
         1V+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679611880; x=1682203880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0OX40ehjV5gIkQr/Q9nraxMiJdzGjqFLifP7n6ggXk=;
        b=mABLQ/xyBQbUpyFYn8YGhTBIIERt7C9SPr9r5KQsKkKL4fYAD5u7EnGWrMc3Rrz/zP
         Pr+Lr2g4WsfTHWnnNDroUeYSR4E6ckuEBMG4aprATMWh2YcaPW8MBPF15kW7VMe5x/2Y
         fGa/xrXQ6fmDTVNH86RD60CPbpLbvf9gpIXQNTzxBXupWU4PUbjqXOayPmkiI75ukbkt
         nWex98i5knu5sMIJ8x92RHEHU60ky0scHBe7PpXbZcw+59P2YR81KOArP/eRcJzM8H78
         sfAnlFWhvngSInN0wNThPGV4/uHWsYAj560SYC9NNGd7gunGMuDRnSU9SWU7rOgViMcl
         MPsA==
X-Gm-Message-State: AAQBX9ctlor5q69ofmgBYgyauhfS14IqfmRI5MYiwiGbL0ryzqU0gZTg
	njgPNNDT2rSN1vnr8AVCZOw4iA==
X-Google-Smtp-Source: AKy350YwB4kYOrekaxdEpI+hPuVho+rJnXECPnSPxRKXmlcV0fNHAsS4nvedwv84jZJ4QD01oSfi+Q==
X-Received: by 2002:a17:903:788:b0:1a1:bf37:7c2e with SMTP id kn8-20020a170903078800b001a1bf377c2emr225398plb.4.1679611879706;
        Thu, 23 Mar 2023 15:51:19 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id x21-20020a170902ea9500b0019b9a075f1fsm12871828plb.80.2023.03.23.15.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 15:51:19 -0700 (PDT)
Message-ID: <6c507b78-35fb-fe23-51f0-e5bb754679d0@kernel.dk>
Date: Thu, 23 Mar 2023 16:51:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND v3] nbd_genl_status: null check for nla_nest_start
To: =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Josef Bacik <josef@toxicpanda.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, Navid Emamdoost <navid.emamdoost@gmail.com>,
 Michal Kubecek <mkubecek@suse.cz>
References: <20230323193032.28483-1-mkoutny@suse.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230323193032.28483-1-mkoutny@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Z2qeoLbN6B.A.0NE.awNHkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2408
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6c507b78-35fb-fe23-51f0-e5bb754679d0@kernel.dk
Resent-Date: Thu, 23 Mar 2023 23:09:14 +0000 (UTC)

On 3/23/23 1:30 PM, Michal Koutný wrote:
> From: Navid Emamdoost <navid.emamdoost@gmail.com>
> 
> nla_nest_start may fail and return NULL. The check is inserted, and
> errno is selected based on other call sites within the same source code.
> Update: removed extra new line.
> v3 Update: added release reply, thanks to Michal Kubecek for pointing
> out.

Josef? Looks straight forward to me, though it's not clear (to me) how
this can be triggered and hence how important it is.

> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> Reviewed-by: Michal Kubecek <mkubecek@suse.cz>
> Link: https://lore.kernel.org/r/20190911164013.27364-1-navid.emamdoost@gmail.com/
> ---
> 
> I'm resending the patch because there was apparent consensus of its
> inclusion and it seems it was only overlooked. Some people may care
> about this because of CVE-2019-16089.

Anyone can file a CVE, and in fact they are often filed as some kind
of silly trophy. Whether a CVE exists or not has ZERO bearing on
whether a bug is worth fixing.

So please don't mix CVEs into any of this, they don't matter one bit.
Never have, and never will. What's important is how the bug can be
triggered.

-- 
Jens Axboe


