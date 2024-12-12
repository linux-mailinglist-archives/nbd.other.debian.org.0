Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 526649EDEEB
	for <lists+nbd@lfdr.de>; Thu, 12 Dec 2024 06:30:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8D6A82049C; Thu, 12 Dec 2024 05:30:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 12 05:30:10 2024
Old-Return-Path: <cipkuehl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F09CF203FE
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Dec 2024 05:12:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.199 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id TlfZlgtyYheI for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Dec 2024 05:12:21 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 143B92045F
	for <nbd@other.debian.org>; Thu, 12 Dec 2024 05:12:18 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-723f37dd76cso169961b3a.0
        for <nbd@other.debian.org>; Wed, 11 Dec 2024 21:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733980334; x=1734585134; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTmsFswdqjlRaaLDngC03DhcckmTMq2ZRXxBokOUsvU=;
        b=ROfmVaLxn/udO9hotXP9mPFEdF0S1kJ+rnELTOctyE3Vb7+B0kavwFubbEXjPHpBRu
         V/ldqBJlwJJlciZFAQ6/bu3/DNL/KLw4EL1iJhKquMQ6abIxMx+T+f5JRHTqOMKkGscd
         8KQDHrzbD2TamU4As/JgPAXCarwa+O/iwpLXapPVYSDGTFUYTPASepwt7OtPTGzr6Ycl
         f/KaKG6kOdVbFM24BTQi4yRfUa+QPx7S3dacfLDhJqnPd+TmKYoSbK61gvqi5BoX385f
         256T/QDonCLaqzRBLHV5LxQFX8zINIA8Ve1DcbyQFxf+WfzWHzv7XJSLq9minaihd4QL
         5fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733980334; x=1734585134;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTmsFswdqjlRaaLDngC03DhcckmTMq2ZRXxBokOUsvU=;
        b=K8DOlZeJtXy62K1s8YcnojJHvLoUJv91xbh9S4zC5uY7bqLZ01R5+r0CQlTwzkyNeZ
         lEbPuzft3GSzDc5p+qe9COrBBy8m1cBn68UiqGI3Nhr0kbNhDi8Fqk1czYAH9d7lMGzE
         Dk39J/ki2YlVOnK0XMnLSF7/9HaSZH15HUpzfOAv+zl+0jM1C6iqlNNbmfjEjQDkQ6f8
         opFx93Kd/UtcFXguiDb2HQqATKcjMHkW6gCm6zKrLLmOzFO3jkehmkaQfEYC2GU+4VRm
         ewB5xeYrXF/BEIfjN32zjjl10zlnn0a1HZGzRtTZO5LJ07SNoDw+JQ4P16IlSPmgfiMr
         X1pg==
X-Gm-Message-State: AOJu0YzF3e8ZJFGdNPuw8j5DQ/P6DQM35LNl9G7LXTVVU/G+6/655vbl
	Qi+NI/W/fKKfdlrz/GkQ0oSTz4mvGnUjCoaDA19x3IbWlzCmseJA
X-Gm-Gg: ASbGncuDRpXgg1dPkFMPRLiQx5niHh9UfkBNWYf2VzoZbpxB5DGYRILFi9paifzzOUC
	TcTU1rJkqQfxXkoOgkP9w8yHNc/GyaOJG3rcuQLbs7B9NT2hujWsnow2gXWPB0wWBcg8PjU/2yu
	1r1jdykcNARK2SmGAGUwfg0g11XVtD/yRIc2hif5/OBihz/Evg4j5tV73RLu7dNUF/o1Q+1OrUC
	hzGaXYH1mPGBQhqDAmurmjIhhMlkq9N+i1ulUvyYVA5tvZGpcEOxw4X3zoOZP0yROx1LALU
X-Google-Smtp-Source: AGHT+IF8lc4o3PGJtRf8VtlK9FMYvmq+2pdwu7hS2lLIJlBzdj45nKtUfp1X4IxNseAuOaebV5HPpQ==
X-Received: by 2002:a05:6a00:849:b0:725:d1d5:6d80 with SMTP id d2e1a72fcca58-728fa9d3a03mr2489479b3a.7.1733980334087;
        Wed, 11 Dec 2024 21:12:14 -0800 (PST)
Received: from [10.69.10.107] ([50.38.53.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f0e81fc8sm5923295b3a.53.2024.12.11.21.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 21:12:13 -0800 (PST)
Message-ID: <89dfc797-b4ab-42d0-b624-7e88a255cfd5@gmail.com>
Date: Wed, 11 Dec 2024 21:12:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Connor Kuehl <cipkuehl@gmail.com>
Subject: Re: question on NBD idempotency
To: eblake@redhat.com
Cc: nbd@other.debian.org
References: <2i75j4d6tt6aben6au4a3s63burx3kvtywhb3ecbh3w2eoallm@ye34afaah6ih>
Content-Language: en-US
In-Reply-To: <2i75j4d6tt6aben6au4a3s63burx3kvtywhb3ecbh3w2eoallm@ye34afaah6ih>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GpKwEQYOBuM.A.0n1G.iTnWnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3197
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/89dfc797-b4ab-42d0-b624-7e88a255cfd5@gmail.com
Resent-Date: Thu, 12 Dec 2024 05:30:10 +0000 (UTC)

> I'm trying to develop a Kubernetes CSI driver that, among other
> things, will be creating and tearing down NBD connections to other
> hosts in the cluster, and am looking for idempotency design ideas.

Hey Eric,

This sounds cool! Is this pushed to a public repo somewhere that
people can follow along?

--
Connor

