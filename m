Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 295BF48EEFC
	for <lists+nbd@lfdr.de>; Fri, 14 Jan 2022 18:06:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E86002024F; Fri, 14 Jan 2022 17:06:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 14 17:06:00 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C7AA320227
	for <lists-other-nbd@bendel.debian.org>; Fri, 14 Jan 2022 17:05:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uhTtN25oajVz for <lists-other-nbd@bendel.debian.org>;
	Fri, 14 Jan 2022 17:05:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 841EC201FC
	for <nbd@other.debian.org>; Fri, 14 Jan 2022 17:05:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 25-20020a05600c231900b003497473a9c4so8466872wmo.5
        for <nbd@other.debian.org>; Fri, 14 Jan 2022 09:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=Oi/sccizMMux3skA0N3TzagjaFYSgV4TjzVapq+TuHI=;
        b=0hZkBfS+GfTMpJJEUrBkQ7FBLCNDmbgCa9mPkhSPYmQIqtCCfuVS5l585y54mybF9t
         zy3rYFG2r9MQKvMd6uqEWdvPgAiaOaEhW7DTxkTz3hGqQqL/SrMsbHWhPGE6C6ePF5Fc
         ZkspvZxlrZc+7KQ/+GjJ0ym1/XhcA8dAKVtMtiqdw5Wutidi7wok9CfU5J2TskNOIl+Z
         O9D+ysthMr0IQq2q7F1D4h1T1L34W9e7S1KpnNZu2eTQLCpAEQH0x9c/5uEAO46d9bDl
         HUzmhs0cPJE8SoyWDpMxYAzk3RnSMQMhevdDdQCqn8bCvZlB9q2FLbwZ4sFPXOPkghZO
         BtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=Oi/sccizMMux3skA0N3TzagjaFYSgV4TjzVapq+TuHI=;
        b=hH1yhBLs6RLKvNtlxR1mPtaAW/WEWgeR3396OGmKCtn6QRea4wlnM0IgFPJqcDHUJe
         ksBXL7+SHtkYZ5XbIGfJvLt1q8OcxHmvmfy42aSoq6zuuWitloBYbzMRwaxdCrpItPgm
         TNvirW+xQ9ET4Jnfc9AY9Zfr1gbVcV5eYZyockMd7ddl0WS2Of/lloSUE+MNziI6TDCL
         VZ+yj1TUw0lqaG8YF8Zn9ylkQJVtIEC1CrXC/3Aq3YHXp3Ct+53JOiTAqj6GzXKNTjx+
         /5/T5eA7mTLNgraZPoUHgwiZzG3LigNUaWYmUM6ZF5OCyIQT1rq6eiGihUpx8c1aTvKV
         5Nzw==
X-Gm-Message-State: AOAM530+yDwTj3MFRU7PhL9x3eVfGqlwITkvQaB7Ho1s/j40+chg4aNk
	z6a2MRkH+H98MCe989vnwOTe94u68qnoxQ==
X-Google-Smtp-Source: ABdhPJx67yWEqB8JIrHCGYE1hLnj8O9Irzy563iOk6CpBiG2dZZ87WJBIMw98vyoV1+9D8EbM5/jUA==
X-Received: by 2002:adf:f791:: with SMTP id q17mr9318595wrp.311.1642179944551;
        Fri, 14 Jan 2022 09:05:44 -0800 (PST)
Received: from ?IPV6:2003:d9:9709:5700:d6b9:b73a:e78d:7d87? (p200300d997095700d6b9b73ae78d7d87.dip0.t-ipconnect.de. [2003:d9:9709:5700:d6b9:b73a:e78d:7d87])
        by smtp.googlemail.com with ESMTPSA id a3sm7344011wri.89.2022.01.14.09.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 09:05:44 -0800 (PST)
Message-ID: <4327e77e-4f65-0b2d-f1d4-039a728a3958@colorfullife.com>
Date: Fri, 14 Jan 2022 18:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: nbd@other.debian.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
From: Manfred Spraul <manfred@colorfullife.com>
Subject: Magics 0x12560953 and 0x96744668 for nbd.h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AYAFTuXYx0O.A.5YC.41a4hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1689
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4327e77e-4f65-0b2d-f1d4-039a728a3958@colorfullife.com
Resent-Date: Fri, 14 Jan 2022 17:06:00 +0000 (UTC)

Hi,

I've tried to figure out details about the "do *not* use" magic values 
for nbd.

They are referenced from the documentation in the current linux kernel!

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/magic-number.rst?h=v5.16#n99

 > NBD_REQUEST_MAGIC 0x12560953 nbd_request ``include/linux/nbd.h``

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/magic-number.rst?h=v5.16#n137

> NBD_REPLY_MAGIC       0x96744668       nbd_reply                ``include/linux/nbd.h``


That is stale, correct?

Still in use:
https://elixir.bootlin.com/linux/2.1.116pre2/source/include/linux/nbd.h

Not used anymore, replaced with new values
https://elixir.bootlin.com/linux/2.1.116/source/include/linux/nbd.h

Thus a bit outdated.
Should I send a patch to update it?
And: The translations are manually maintained, correct? Thus all files need to be updated.

--
	Manfred

