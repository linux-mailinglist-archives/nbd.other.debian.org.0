Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDA249E1D4
	for <lists+nbd@lfdr.de>; Thu, 27 Jan 2022 13:01:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9FBF320474; Thu, 27 Jan 2022 12:01:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 27 12:01:36 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E4F89203D1
	for <lists-other-nbd@bendel.debian.org>; Thu, 27 Jan 2022 12:01:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OS700Tjoi13b for <lists-other-nbd@bendel.debian.org>;
	Thu, 27 Jan 2022 12:01:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7CED9203CB
	for <nbd@other.debian.org>; Thu, 27 Jan 2022 12:01:22 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w11so4348694wra.4
        for <nbd@other.debian.org>; Thu, 27 Jan 2022 04:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=TUzKKm70vP7PJd4w2Jditj3Tfhu2ODw4SVRe5pTd248=;
        b=vOt1fs5UbgZVm0jwTTLKCWM60eu8HnzdWDPLrYvrjUksq1U64QdOLm/8eNh022IHl9
         A2hBpXOvSXnjj+qrCMiSHxK/7di2RCStu46FT/BkILzNfXtWY0CYAc7UBfrZJQPGV0Of
         pznrKHAL2QLkLuMixPg6RdglYgjo5IhUwJM6NLkTW7yJrkGzZ7oBxnDImYfuUXJIVis+
         OO5fyRmKZKITMeryuvViUchvNb0Uf+GVatdqtnUpuubmJeUAKkAii6npiarivygafTGT
         f8xy6S+crer7i+uW8HDPdINVU6nc49YuTnpSjryaWiH3+FnlTtgt2sRkt7DH81FqVP0j
         ZTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TUzKKm70vP7PJd4w2Jditj3Tfhu2ODw4SVRe5pTd248=;
        b=iN9gKEgUVNTATiJZNihd29Mgv/q4rxzrMstu9MKGEmgAP7bsofwjqp5k95gya75AL8
         9Gyz6kr45ziphIkSAbKBhpOIG6lLEd2tpnh9PUDy0lE1e3Oef8zpF9WnL6I4ybFkt8oY
         I4iJj9QkLX9bJOMLiMukZbz1t7rrP4qH+PUFZtHb9EIy93oJyqlVfG1y5p41tuoW4Igg
         XQdcXKsUAKymU9Yuu/JBA3cHfVCHsDn8tsc4LhNbyqTqlT+14YZuM0gPtSC3rNNhknlk
         KwBxRGpLxQfVjk2y1HI3TgQS/fRVImqZRibQL13QAtb/3eUA6pxTJ84CNIJs6mb7Ofim
         wAlQ==
X-Gm-Message-State: AOAM533fS7Q90c85atL8LAswcQDGDDJWJvNGsmh1kauvYttXy5W9PwiN
	joqRzTmxkYfQdl5hwLb0VnTAXOywUFkfNQ==
X-Google-Smtp-Source: ABdhPJxcA6jbQbI6H/uJG2uFTmSamoWwrFx1DXJ+HAKFN3l+A7XZoWBKWiIEfNeSF09ch6PyoF9BMA==
X-Received: by 2002:adf:eb83:: with SMTP id t3mr2735137wrn.240.1643284878848;
        Thu, 27 Jan 2022 04:01:18 -0800 (PST)
Received: from ?IPV6:2003:d9:9707:d500:f72a:8d22:e3d4:f73? (p200300d99707d500f72a8d22e3d40f73.dip0.t-ipconnect.de. [2003:d9:9707:d500:f72a:8d22:e3d4:f73])
        by smtp.googlemail.com with ESMTPSA id i17sm1892676wru.107.2022.01.27.04.01.18
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 04:01:18 -0800 (PST)
Message-ID: <2f1403c1-a981-d224-2b51-6e2d422dce3b@colorfullife.com>
Date: Thu, 27 Jan 2022 13:01:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/9] Add data to datalog, add replay tool, V03
Content-Language: en-US
To: nbd@other.debian.org
References: <20220121175711.5083-1-manfred@colorfullife.com>
 <403C0885-CD51-4E1E-964C-553AB6D18458@uter.be>
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <403C0885-CD51-4E1E-964C-553AB6D18458@uter.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vYQHIKiFVLJ.A.dOG.gmo8hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1708
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2f1403c1-a981-d224-2b51-6e2d422dce3b@colorfullife.com
Resent-Date: Thu, 27 Jan 2022 12:01:36 +0000 (UTC)

Hi Wouter,

On 1/27/22 09:34, Wouter Verhelst wrote:
> Hi,
>
> This looks great at first sight.
>
> Unfortunately I'm rather busy at the moment (I'm deeply involved in 
> FOSDEM), so I won't be able to review this in detail into early next 
> month.
>
No need to hurry.
My main focus right now is the discussion with the file system 
developers: Is the output useful?
> I intend to do a release to fix the security issues that were pointed 
> out then, and also incorporate this if we can manage it, though if 
> there are significant issues I don't plan on deleting the release for 
> that, at least not much.
>
Fully agreed.

> Manfred Spraul <manfred@colorfullife.com> schreef op 21 januari 2022 
> 19:57:02 GMT+02:00:
>
>     Hi,
>
>     Updated series.
>     New is:
>     - Patch 0004: Update proto.md
>     - Patch 0009: An initial man page.
>
>     Review feedback is welcome!
>
>     And: What else is needed for a new tool?
>     Should I try to create a test case?
>
>     --
>     	Manfred
>
>
> -- Verstuurd vanaf mijn Android apparaat met K-9 Mail. Excuseer mijn 
> beknoptheid.

--

     Manfred

